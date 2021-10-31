

1. This was meant to be advanced demo, But it is not so.
2. I was planning to deploy two instance in their own Zones. Looks like it is too earlier for me.
3. Now, here two  instances are deployed but in their own AZ using their own aws_instance blocks
   1. So here webserver01 is installed in eu-central-01a and webserver02 is installed on eu-central-01b
   2. ideally, I was expecting to write a single aws_instance block and use count function to loop but subnets ip map is required before I do it.