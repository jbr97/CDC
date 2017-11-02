import os

dataset = 'val'

inputdir = '../predata/test/' + dataset + '.lst'
outputdir = dataset + '.prefix.lst'


lst = ''
mp = {}
feat_dir = dataset + '_feat'

os.mkdir(feat_dir)
with open(inputdir, 'r') as f:
	lines = f.readlines()
	for line in lines:
		a = line.strip()
		a = a.split('/')[-2:]
		a[1] = a[1][:-4]
		b = feat_dir + '/' + a[0]
		a = feat_dir + '/' + '/'.join(a)
		if not b in mp:
			print(b)
			mp[b] = 1
			os.mkdir(b)
		lst = lst + a + '\n'

with open(outputdir, 'w') as f:
	f.write(lst)

