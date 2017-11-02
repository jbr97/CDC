
lst = ''
with open('test.lst', 'r') as f:
	lines = f.readlines()
	for line in lines:
		a = line.strip().split('/')
		a[-3] = 'test_' + a[-3]
		a = '/'.join(a)
		lst = lst + a + '\n'
with open('temp.lst', 'w') as f:
	f.write(lst)
