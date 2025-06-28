create database Company;
use Company;

create Table Employee (
        Num_E INT PRIMARY KEY,
		Fullname VARCHAR(255),
		Position VARCHAR(255),
		Salary DECIMAL(10,2),
		Num_S INT,
		FOREIGN KEY (Num_S) REFERENCES Department (Num_S)
		);

create table Department(
          Num_S INT PRIMARY KEY,
		  Label_S	VARCHAR(255),
		  Manager_name VARCHAR(255)
		  );
create table Project (
           Num_P INT PRIMARY KEY,
		   Title VARCHAR(255),
		   Start_Dates DATE,
		   End_Dates DATE,
		   Num_S INT,
		   FOREIGN KEY (Num_S) REFERENCES Department (Num_S)
		   );
--table d'association 
create table Employee_Project (
             Num_E INT,
			 Num_P INT,
			 Roles VARCHAR(255),
			 Primary KEY (Num_E,Num_P),
			 FOREIGN KEY (Num_E) REFERENCES Employee (Num_E),
			 FOREIGN KEY (Num_P) REFERENCES Project (Num_P)
			 );
INSERT INTO Department VALUES (1, 'IT', 'Alice Johnson'),
                              (2, 'HR', 'Bob Smith'),
							  (3, 'Marketing' , 'Clara Bennett');

INSERT INTO Employee VALUES (101, 'Joe Doe', 'Developer', 60000.0 , 1),
                            (102, 'Jane Smith' , 'Analyst', 55000.00, 2),
							(103, 'Mike Brown', 'Designer ', 50000.00, 3),
							(104, 'Sarah Johnson', 'Data Scientist', 70000.00, 1),
							(105, 'Emma Wilson', 'HR Specialist', 52000.00, 2);
INSERT INTO Project VALUES (201,'Website Redesign', '2024-01-15', '2024-06-30', 1),
                           (202,'Employee Onboarding', '2024-03-01', '2024-09-01', 2),
						   (203,'Market Research', '2024-02-01', '2024-07-31', 3),
						   (204,'IT Infrastructure Setup', '2024-04-01', '2024-12-31', 1);
INSERT INTO Employee_Project VALUES (101, 201, 'Frontend Developer'),
                                    (104, 201, 'Backend Developer'),
									(102, 202, 'Trainer'),
									(105, 202, 'Coordinator'),
									(103, 203, 'Research Lead'),
									(101, 204, 'Network Specialist');

UPDATE Employee_Project SET  Roles='Full Stack Developer'  WHERE Num_E=101; 

DELETE FROM Employee_Project WHERE  Num_E=103;
DELETE FROM Employee WHERE  Num_E=103;