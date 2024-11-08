# E-Farmer: Online Farming Shopping Portal 

## Project Description
E-Farmer is an Online Transaction Processing (OLTP) system that directly connects farmers with consumers, facilitating the purchase and sale of agricultural products without intermediaries. The system streamlines order processing, payment handling, and logistics, enhancing transparency and efficiency across the supply chain.

## Objective
The primary goals of this project are to:

Enable farmers to list and sell products directly to consumers.
Provide consumers with an online platform to browse and purchase agricultural goods.
Automate key processes, including order management, payment processing, and logistics.

## Project Setup Instructions
Follow the steps below to set up the E-Farmer project. Execute each script in the specified order.

### Prerequisite
Ensure that Oracle SQL Developer is installed and connected to a valid database connection.

## Step 1: Application Admin Creation
Begin by setting up an application administrator user who will manage the application. This admin account will be used to execute subsequent scripts.

Run CreateAdminUser.sql to create the application admin user with the necessary credentials.

Use the credentials from the above script to establish a connection with the application admin user in Oracle SQL Developer.Connect to the database using the application admin user account.

## Step 2: Execute Data Definition Language (DDL) Scripts
Navigate to the DDL folder and execute the scripts in the following order to create the required database tables:

1.Farmer.sql

2.Consumer.sql

3.Product.sql

4.Inventory.sql

5.Order_Item.sql

6.Order.sql

7.Payments.sql

8.Logistics.sql

After creating the tables, execute the scripts below to create views:

1.Consumer_View.sql

2.Inactive_Products_View.sql

3.CurrentInventoryStatusView.sql

4.Discount_On_Perishable_View.sql

5.WeekWiseSalesView.sql

6.TopSellingView.sql

## Step 3: Execute Data Manipulation Language (DML) Scripts
After creating the tables and views, navigate to the DML folder and populate the tables with sample data by executing the following scripts in order:

1.Farmer_Insert.sql

2.Consumer_Insert.sql

3.PRODUCT_Insert.sql

4.Inventory_Insert.sql

5.Order_Items_Insert.sql

6.Order_Insert.sql

7.Payments_Insert.sql

8.Logistics_Insert.sql

## Step 4: Create Users and Grant Access
To set up standard users and assign them the appropriate roles, execute the following script:

User_grant.sql - This script creates user accounts for farmers, consumers, and other roles, granting them the necessary permissions to interact with the database.
