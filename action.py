import os
#print(os.listdir(os.getcwd()))
#print("hello the world from python!!!")
v3 = ''
v4 = ''

command = 'cd my_micropython/ports/esp32 && pwd && make'
print(command)
result = os.popen(command).read()
print(result)
print(result.splitlines())
for line in result.splitlines():
    if 'Supported git hash' in line:
        print('find a line with hash: {0:s}'.format(line))
        line_temp = line.split(':')
        if 'v3' in line_temp[0]:
            v3 = line_temp[1].strip()
        elif 'v4' in line_temp[0]:
            v4 = line_temp[1].strip()

command = 'echo "::set-output name=hash_v3::{0:s}"'.format(v3)
print(command)
print(os.popen(command).read())

command = 'echo "::set-output name=hash_v4::{0:s}"'.format(v4)
print(command)
print(os.popen(command).read())

print(os.environ['INPUT_IDF'])

if 'IDF3' == os.environ['INPUT_IDF']:
    command = 'echo "::set-output name=hash_selected::{0:s}"'.format(v3)
    print(command)
    print(os.popen(command).read())
elif 'IDF4' == os.environ['INPUT_IDF']:
    command = 'echo "::set-output name=hash_selected::{0:s}"'.format(v4)
    print(command)
    print(os.popen(command).read())


