-- create table users(email varchar(255) primary key, password varchar(255));

-- INSERT into users(email, password) values('employee@example.com', 'employee123');
-- INSERT into users(email, password) values('hr@example.com', 'hr123');
-- INSERT into users(email, password) values('manager@example.com', 'manager123');

drop table details;

create table details(email varchar(255) primary key, name varchar(255), phoneNo varchar(255), address varchar(255), role varchar(255), 
    department varchar(255), managerName varchar(255), jobLocation varchar(255), experience varchar(255), Competencies Text, TrainingsReceived Text,
    goals Text, feedback Text, CustomerRating Text, ManagersOverallRating Text,
    TrainingSuggested Text, Incentives Text);

INSERT INTO details(email, name, phoneNo, address, role, department, managerName, jobLocation, experience, Competencies, TrainingsReceived, goals, feedback, CustomerRating, ManagersOverallRating, TrainingSuggested, Incentives) 
VALUES (
    'employee@example.com', 
    'Yash Raj', 
    '+919878967342', 
    'House no. 102, Bhosalenagar, Pune', 
    'Food Delivery', 
    'Food Delivery', 
    'Deependar Goyal', 
    'Pune', 
    '12 months',
    '[{"text":"Cultural sensitivity"},{"text":"Active listening"}, {"text":"Hygiene and food safety knowledge"}]',
    '[{"text": "Time management"}, {"text": "Route optimization"}, {"text": "Customer service"}, {"text": "Speed and efficiency"}, {"text": "Food handling and Hygiene awareness"}]', 
    '[{"goal": "Improve on-time delivery performance", "status": "80", "KPI": "% of deliveries completed on time (Target: 95%)", "KRA": "Timeliness of deliveries"}, {"goal": "Enhance customer interaction skills", "status": "50", "KPI": "Customer rating (Target: 4.5/5 or above)", "KRA": "Customer rating (Target: 4.5/5 or above)"}, {"goal": "Optimize travel time", "status": "40", "KPI": "Avg. delivery time per order (Target: <30 min)", "KRA": "Avg. delivery time per order (Target: <30 min)"}]',
    '[{"text": "Great job maintaining on-time deliveries! Your navigation skills are commendable. Keep working on improving customer interaction for even better ratings"}]', 
    '[{"rating": "3.5"}]', 
    '[{"rating": "4.5"}]', 
    '[{"text": "Customer Service Training, Fuel and cost optimization"}]', 
    '[{"text": "₹2000 bonus + \"Star Performer\" badge + Priority orders"}]'
);
INSERT INTO details(email, name, phoneNo, address, role, department, managerName, jobLocation, experience, Competencies, TrainingsReceived, goals, feedback, CustomerRating, ManagersOverallRating, TrainingSuggested, Incentives) 
VALUES (
    'employee2@example.com', 
    'Hemant Tyagi', 
    '+919638527411', 
    'HNo. 5, Shinchanagar, Pune', 
    'Grocery Delivery', 
    'Delivery', 
    'Deependar Goyal', 
    'Pune', 
    '25 months',
    '[{"text":"Emergency handling"}, {"text":"Inventory management"}, {"text":"Order accuracy verification"}]',
    '[{"text": "Time Management"}, {"text": "Order Accuracy"}, {"text": "Safety Awareness"}, {"text": "Cash Handling"}, {"text": "Heavy Lifting"}]', 
    '[{"goal": "Improve heavy-load management", "status": "80", "KPI": "Maximum number of large orders handled per shift (Target: 10+)", "KRA": "Weight Management & Heavy Lifting"}, {"goal": "Ensure correct product replacement", "status": "50", "KPI": "% of appropriate substitutions (Target: 95%)", "KRA": "Substitution & Decision-Making"},{"goal": "Reduce long-distance delivery issues", "status": "80", "KPI": "Avg. fuel efficiency per km (Target: ₹2.5/km or lower)", "KRA": "Long-Distance Route Planning"}]',
    '[{"text": "Great effort in managing heavy loads efficiently! Work on making better product"}]', 
    '[{"rating": "4.5"}]', 
    '[{"rating": "3.5"}]', 
    '[{"text": "Food handling and safety"},{"text": "Conflict resolution"}]', 
    '[{"text": "₹500 bonus + Insurance top-up"}]'
);
INSERT INTO details(email, name, phoneNo, address, role, department, managerName, jobLocation, experience, Competencies, TrainingsReceived, goals, feedback, CustomerRating, ManagersOverallRating, TrainingSuggested, Incentives) 
VALUES (
    'employee3@example.com', 
    'Gaurav Sharma', 
    '+919856321478', 
    'HNo. 10, Pimpri-Chinchwad, Pune', 
    'Grocery Delivery', 
    'Delivery', 
    'Deependar Goyal', 
    'Pune', 
    '2 months',
    '[{"text":"Situational awareness"}, {"text":"Decision-making skills"}, {"text":"Stress management"}]',
    '[{"text": "Multi-Order Management"}, {"text": "Temperature Sensitivity"}, {"text": "Problem-Solving"}, {"text": "Safety Awareness"}, {"text": "Adaptability"}]', 
    '[{"goal": "Manage multiple orders efficiently", "status": "80", "KPI": "Avg. number of orders per trip (Target: 3+)", "KRA": "Multi-Order Handling"}, {"goal": "Reduce complaints about incorrect orders", "status": "50", "KPI": "% of error-free deliveries (Target: 98%)", "KRA": "Accuracy of Deliveries"},{"goal": "Ensure safe driving practices", "status": "80", "KPI": "Number of traffic violations/incidents (Target: 0)", "KRA": "Safety & Compliance"}]',
    '[{"text": "Your time management skills are strong! Continue improving order accuracy to meet the 98% target."}]', 
    '[{"rating": "4.5"}]', 
    '[{"rating": "3.5"}]', 
    '[{"text": "Food handling and safety, Handling difficult customers"}]', 
    '[{"text": "₹500 bonus + Insurance top-up"}]'
);
INSERT INTO details(email, name, phoneNo, address, role, department, managerName, jobLocation, experience, Competencies, TrainingsReceived, goals, feedback, CustomerRating, ManagersOverallRating, TrainingSuggested, Incentives) 
VALUES (
    'employee4@example.com', 
    'Saurabh', 
    '+919852361478', 
    'HNo. 9, Hinjewadi, Pune', 
    'Food Delivery', 
    'Delivery', 
    'Deependar Goyal', 
    'Pune', 
    '12 months',
    '[{"text":"Health safety"}, {"text":"Managing peak hour and rush"}, {"text":"Fuel and cost optimization"}]',
    '[{"text": "Route optimization"}, {"text": "Customer Service"}, {"text": "Handling fragile items"}, {"text": "Digital literacy"}, {"text": "Inventory checking"}]', 
    '[{"goal": "Deliver all orders within estimated time", "status": "75", "KPI": "% of on-time deliveries(Traget: 97%)", "KRA": "Time management"}, {"goal": "Maintain proper handling of cash", "status": "63", "KPI": "% of accurate transaction(Target:100%)", "KRA": "Cash handling"},{"goal": "Ensure order accuracy", "status": "70", "KPI": "% of correct grocery delivered(Target:98%)", "KRA": "Order accuracy"}]',
    '[{"text": "Your ability to manage multiple orders efficiently is impressive! Focus on reducing order errors slightly to meet the accuracy target."}]', 
    '[{"rating": "4"}]', 
    '[{"rating": "4"}]', 
    '[{"text": "Weather adaption training"},{"text": "Conflict Resolution"}]', 
    '[{"text": "₹1000 bonus + Free petrol voucher"}]'
);
INSERT INTO details(email, name, phoneNo, address, role, department, managerName, jobLocation, experience, Competencies, TrainingsReceived, goals, feedback, CustomerRating, ManagersOverallRating, TrainingSuggested, Incentives) 
VALUES (
    'employee5@example.com', 
    'Amaan Sheikh', 
    '+919631478462', 
    'HNo. A/10, Wagholi, Pune', 
    'Food Delivery', 
    'Delivery', 
    'Deependar Goyal', 
    'Pune', 
    '28 months',
    '[{"text": "Health safety"}, {"text": "Managing peak hour and rush"}, {"text": "Fuel and cost optimization"}]',
    '[{"text": "Route optimization"}, {"text": "Conflict resolution"}, {"text": "Cash handling & digital payments"}, {"text": "Attention to detail"}, {"text": "Customer Service"}]', 
    '[{"goal": "Improve customer communication", "status": "60", "KPI": "No. of resolved complaints (Target:100%)", "KRA": "Conflict Resolution"}, {"goal": "Ensure cash transactions are handled correctly", "status": "50", "KPI": "Number of transaction errors (Target: 0)", "KRA": "Cash handling & digital payments"},{"goal": "Maintain order accuracy", "status": "65", "KPI": "% of correct order delivered(Target:99%)", "KRA": "Attention to Detail"}]',
    '[{"text": "Excellent handling of cash transactions with zero errors! Try to improve conflict resolution speed to enhance customer experience."}]', 
    '[{"rating": "4"}]', 
    '[{"rating": "3"}]', 
    '[{"text": "Politeness & Professionalism"},{"text": "Navigation & delivery efficicency"},{"text":"Defensive driving training"}]', 
    '[{"text": "No bonus, but eligible for improvement training"}]'
);


drop table managers;

create table managers(email varchar(255) primary key, name varchar(255), phoneNo varchar(255), address varcher(255), 
    department varchar(255), jobLocation varchar(255), employees Text);


INSERT into managers(email, name, phoneNo, address, department, jobLocation, employees) 
    values('manager@example.com', 'Deepender Goyal', '+919843467342', '301, Avenue Apartment, Pune', 'Manager',
    'Kharadi, Pune', "[{'name': 'Peter Parker', 'role': 'Developer', 'yoe': '3',  'email': 'employee@example.com'}, {'name': 'Chris Evans', 'role': 'Tester', 'yoe': '5', 'email': 'employee2@example.com'}]");