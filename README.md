# myTestCookbook

This cookbook was created to illustrate Chef not watching the desired state of a property with a default value unless accessed first.

To recreate:
1. `git clone https://github.com/jakauppila/myTestCookbook`
2. `kitchen converge`
3. `kitchen exec -c "echo 'Goodbye World.' >> /home/vagrant/myfile.txt"`
4. `kitchen converge`