BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS internships (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    company TEXT NOT NULL,
    position TEXT NOT NULL,
    description TEXT,
    required_skills TEXT NOT NULL,
    location TEXT NOT NULL,
    duration TEXT,
    stipend TEXT
);

CREATE UNIQUE INDEX IF NOT EXISTS idx_internships_company_position
ON internships(company, position);

INSERT OR IGNORE INTO internships (company, position, description, required_skills, location, duration, stipend) VALUES
('National Informatics Centre', 'Digital India Internship - NIC', 'Work on cutting-edge IT projects with government systems. Focus on web development, database management, and digital governance solutions.', 'python,java,web development,database,react', 'Delhi', '6 months', '₹15,000/month'),
('Unique Identification Authority of India', 'Data Analytics Internship - UIDAI', 'Analyze Aadhaar ecosystem data to derive insights for better service delivery. Work with big data technologies and privacy-preserving analytics.', 'python,data analysis,sql,machine learning,statistics', 'Bangalore', '4 months', '₹18,000/month'),
('Ministry of Electronics & IT', 'AI Research Internship - MeitY', 'Research and development in artificial intelligence applications for government services. Work on NLP, computer vision, and ML models.', 'python,machine learning,ai,tensorflow,nlp', 'Hyderabad', '6 months', '₹25,000/month'),
('Computer Emergency Response Team', 'Cybersecurity Analyst - CERT-In', 'Join India''s national cybersecurity team to research threats, develop security protocols, and contribute to national cyber defense.', 'cybersecurity,networking,python,linux,security', 'Delhi', '6 months', '₹30,000/month'),
('Digital India Corporation', 'Web Development Internship - Digital India', 'Develop and maintain government web portals and citizen services platforms. Focus on user experience and accessibility.', 'html,css,javascript,react,web development', 'Mumbai', '4 months', '₹12,000/month'),
('TechNova Solutions', 'Software Developer Intern', 'Assist in developing web applications and debugging code.', 'Python, Django, Git', 'Bangalore', '3 months', '₹15,000/month'),
('MediCore Analytics', 'Data Analyst Intern', 'Work with healthcare data to generate reports and insights.', 'SQL, Excel, Power BI', 'Hyderabad', '6 months', '₹12,000/month'),
('GreenFuture Energy', 'Research Intern', 'Support renewable energy projects with data collection and analysis.', 'Research, Excel, MATLAB', 'Delhi', '2 months', 'Unpaid'),
('FinEdge Capital', 'Finance Intern', 'Assist in portfolio analysis and financial reporting.', 'MS Excel, Financial Modeling', 'Mumbai', '4 months', '₹10,000/month'),
('EduMentor', 'Content Writer Intern', 'Create educational content for e-learning platforms.', 'Writing, SEO, MS Word', 'Remote', '3 months', '₹5,000/month'),
('CloudSphere Tech', 'Cloud Engineer Intern', 'Assist in deployment of cloud-based applications.', 'AWS, Docker, Kubernetes', 'Pune', '6 months', '₹18,000/month'),
('ByteForge', 'Mobile App Developer Intern', 'Develop Android/iOS applications with senior devs.', 'Java, Kotlin, Flutter', 'Kolkata', '3 months', '₹12,000/month'),
('AgriSmart', 'IoT Intern', 'Develop IoT-based solutions for smart farming.', 'Arduino, Sensors, C++', 'Chennai', '4 months', '₹8,000/month'),
('HealthifyNow', 'Machine Learning Intern', 'Work on predictive models for healthcare monitoring.', 'Python, TensorFlow, ML', 'Bangalore', '6 months', '₹20,000/month'),
('DesignHub', 'UI/UX Intern', 'Assist in wireframing and designing mobile/web interfaces.', 'Figma, Adobe XD, CSS', 'Remote', '3 months', '₹7,000/month'),
('SecureNet', 'Cybersecurity Intern', 'Perform vulnerability assessments and penetration testing.', 'Linux, Networking, Kali Linux', 'Noida', '5 months', '₹15,000/month'),
('EcoBuild', 'Civil Engineering Intern', 'Assist in structural design and site inspection.', 'AutoCAD, STAAD Pro', 'Ahmedabad', '2 months', '₹6,000/month'),
('MarketX', 'Digital Marketing Intern', 'Support campaigns with social media and SEO strategies.', 'SEO, Google Analytics, Canva', 'Delhi', '3 months', '₹8,000/month'),
('CodeCrafters', 'Backend Developer Intern', 'Work on APIs and database-driven applications.', 'Node.js, MongoDB, Express', 'Hyderabad', '6 months', '₹16,000/month'),
('SmartAI Labs', 'AI Research Intern', 'Assist in NLP and computer vision projects.', 'Python, PyTorch, ML', 'Bangalore', '6 months', '₹22,000/month'),
('BlueWave Media', 'Graphic Design Intern', 'Design creatives for branding and marketing.', 'Photoshop, Illustrator, Canva', 'Kolkata', '3 months', '₹5,000/month'),
('LogiTrack', 'Operations Intern', 'Support logistics and supply chain operations.', 'Excel, ERP Systems, Communication', 'Gurgaon', '4 months', '₹9,000/month'),
('InnoSoft', 'Full Stack Developer Intern', 'Contribute to frontend and backend of live projects.', 'React, Node.js, SQL', 'Remote', '5 months', '₹14,000/month'),
('WellCare Pharma', 'Biotech Intern', 'Assist in lab research and testing new formulations.', 'Biotech, Lab Techniques, Research', 'Pune', '6 months', '₹12,000/month'),
('Alpha Robotics', 'Robotics Intern', 'Develop control systems for robotic prototypes.', 'C++, Python, ROS', 'Chennai', '6 months', '₹18,000/month');

COMMIT; 