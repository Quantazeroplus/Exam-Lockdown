# GEC WC - Secure Exam Lockdown System 🔐
**Developed by Quantazeroplus**

### 📖 Overview
A lightweight Windows lockdown tool designed for conducting digital exams at **Government Engineering College (GEC), West Champaran**. This system converts standard PCs into a secure kiosk environment, preventing unauthorized access to system files, taskbars, or local storage while viewing a question paper.



### ✨ Key Features
* **Shell Lockdown:** Automatically terminates `explorer.exe` to disable the Taskbar, Start Menu, and Desktop icons.
* **Universal Path Detection:** Uses registry-based detection to find the Desktop path, even on laptops using **OneDrive**.
* **Anti-Download Logic:** Forces PDF viewing via G-Drive `/preview` rendering to prevent students from saving files.
* **Instruction Overlay:** Displays persistent exam rules on the background CMD window accessible via `...`.
* **Secure Recovery:** Only restores the Windows Shell after a teacher-validated password (`Password`) is entered.
* **Self-Cleanup:** Features a self-destruct command (`del %~f0`) to remove the script from the PC after use.

---

### 🛠️ Technical Stack
* **Language:** Windows Batch Scripting (CMD)
* **Security:** System-level process termination and loop logic.
* **Target OS:** Windows 10 & 11.

---

### 🚀 Usage Instructions

1.  **Preparation:** Run the `Installer.bat` on the teacher/admin computer.
2.  **Deployment:** It will generate a `GEC_Exam.bat` file on the Desktop.
3.  **Execution:** Run `GEC_Exam.bat` on the student's PC to start the exam lockdown.
4.  **Student Rules:** * Write answers on Paper/OMR.
    * Use `Alt+Tab` to view rules.
    * `Alt+F4` to close the browser (requires Teacher Password to exit).

---

### 📂 Repository Structure
* `Installer.bat`: The main setup script to generate the lockdown tool.
* `README.md`: Documentation for the system.

---

### 👤 Author
**Sandeep Kumar (Sandy)** *Founder, Quantazeroplus* *B.Tech Computer Science & Engineering (2nd Year)* *GEC West Champaran*

---

### ⚖️ License
This project is for educational use within the GEC West Champaran campus.