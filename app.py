from flask import Flask, request, render_template, jsonify
import sqlite3

app = Flask(__name__)

# Check if username and password exist

def check_user(username, password):
    conn = sqlite3.connect("chayan.db")   # use your DB name
    cur = conn.cursor()
    cur.execute("SELECT * FROM user WHERE username = ? AND password = ?", (username, password))  # use your table name
    result = cur.fetchone()
    conn.close()
    return result

@app.route("/", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form["username"]
        password = request.form["password"]

        if check_user(username, password):
            return render_template("welcome.html", username=username)
        else:
            return "❌ Invalid username or password. <a href='/'>Try Again</a>"

    return render_template("login.html")

# Backend matching algorithm and API endpoint

def compute_matches(field_of_study, skills_csv, location):
    skills_array = [s.strip().lower() for s in skills_csv.split(',') if s.strip()]

    # Load internships from DB
    conn = sqlite3.connect("chayan.db")
    cur = conn.cursor()
    cur.execute(
        "SELECT company, position, description, required_skills, location, duration, stipend FROM internships"
    )
    rows = cur.fetchall()
    conn.close()

    internships = []
    for row in rows:
        company, position, description, required_skills, loc, duration, stipend = row
        internships.append(
            {
                "company": company,
                "position": position,
                "description": description or "",
                "requiredSkills": [s.strip().lower() for s in (required_skills or "").split(',') if s.strip()],
                "location": loc,
                "duration": duration or "",
                "stipend": stipend or "",
                # Back-compat aliases used by frontend
                "title": position,
                "organization": company,
            }
        )

    matches = []
    field = (field_of_study or "").lower()

    for internship in internships:
        score = 0
        matched_skills = []
        for req_skill in internship["requiredSkills"]:
            for user_skill in skills_array:
                if req_skill in user_skill or user_skill in req_skill:
                    score += 20
                    if req_skill not in matched_skills:
                        matched_skills.append(req_skill)
        if location == "Any" or internship["location"] == location:
            score += 10
        if any(k in field for k in ["computer", "it", "software"]):
            score += 15
        if score >= 30:
            match = dict(internship)
            match["matchScore"] = min(score, 100)
            match["matchedSkills"] = matched_skills
            matches.append(match)

    matches.sort(key=lambda m: m["matchScore"], reverse=True)
    return matches[:3]

@app.route("/api/find-matches", methods=["POST"]) 
def api_find_matches():
    try:
        data = request.get_json(force=True) or {}
        field_of_study = data.get("fieldOfStudy", "")
        skills = data.get("skills", "")
        location = data.get("location", "Any")
        if not field_of_study or not skills:
            return jsonify({"error": "fieldOfStudy and skills are required"}), 400
        matches = compute_matches(field_of_study, skills, location)
        return jsonify({"matches": matches})
    except Exception as exc:
        return jsonify({"error": str(exc)}), 500

if __name__ == "__main__":
    app.run(debug=True)
