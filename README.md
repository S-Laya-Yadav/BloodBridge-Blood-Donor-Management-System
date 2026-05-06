# 🩸 BloodBridge – Blood Donor Management System

## 📌 Overview
**BloodBridge** is a web-based Blood Donor Management System that helps users quickly find compatible blood donors during emergencies. It allows users to register as donors and search for donors based on blood group, location, and age.

The system is developed using **Java Full Stack technologies (JSP, Servlets, JDBC)** following a structured **3-tier architecture** and deployed on **Apache Tomcat 11**. The project was built using **Eclipse IDE**, leveraging its enterprise Java development capabilities.

---

## 🚀 Features
- 🔐 User Authentication (Session-based Login & Logout)
- 🧾 Donor Registration System
- 🔍 Advanced Donor Search:
  - Blood Group filter
  - Location filter
  - Age filter
- 📊 Structured Results Display (Dynamic Table Rendering)
- 💻 Responsive and user-friendly UI
- 🔄 Secure Session Management

---

## 🛠️ Tech Stack

### Frontend:
- HTML5  
- CSS3  
- JavaScript  
- JSP (Java Server Pages)

### Backend:
- Java Servlets  
- JDBC (Database Connectivity)

### Database:
- MySQL / SQLite  

### Server:
- Apache Tomcat 11  

### IDE:
- Eclipse (Dynamic Web Project)

---

## 🏗️ Architecture
BloodBridge follows a **3-tier architecture**:

1. **Presentation Layer** – JSP, HTML, CSS  
2. **Business Logic Layer** – Java Servlets  
3. **Data Layer** – JDBC with Database  

---

## 🔗 Servlet–JSP Workflow
1. User submits form via JSP  
2. Request goes to Servlet (Controller)  
3. Servlet processes logic and interacts with DAO  
4. Data stored/retrieved using JDBC  
5. Response forwarded back to JSP  
6. JSP displays dynamic results  

---

## ⚙️ Server Configuration
- Configured **Apache Tomcat 11**
- Deployed as **Dynamic Web Application**
- Used `web.xml` for servlet mapping
- Integrated Tomcat with Eclipse

---

## 💡 Why Eclipse?
- Built-in support for Dynamic Web Projects  
- Easy Tomcat integration  
- Efficient debugging for Servlets & JSP  
- Standard IDE for Java Enterprise development  

---

## Output
<img width="906" height="344" alt="image" src="https://github.com/user-attachments/assets/dc51b8d1-507e-4e86-9bd7-34feea0d60be" />
<img width="625" height="500" alt="image" src="https://github.com/user-attachments/assets/7d2dfece-476e-4be9-b7b0-2ae4418cd9bf" />
<img width="625" height="453" alt="image" src="https://github.com/user-attachments/assets/25467d7b-147e-4eb0-a381-959843715899" />
<img width="906" height="281" alt="image" src="https://github.com/user-attachments/assets/0a18d27d-5051-4636-aaf2-d84ef653618b" />


## 📂 Project Structure
```bash
BloodBridge/
│── src/
│   ├── servlets/
│   ├── dao/
│   ├── model/
│
│── WebContent/
│   ├── css/
│   ├── js/
│   ├── jsp/
│   ├── WEB-INF/
│   │     ├── web.xml
│
│── lib/
│── database.sql
│── README.md

Setup & Installation
git clone https://github.com/your-username/BloodBridge.git
cd BloodBridge
Open in Eclipse
Configure Apache Tomcat 11
Import database.sql
Run on server

Open:

http://localhost:8080/BloodBridge
