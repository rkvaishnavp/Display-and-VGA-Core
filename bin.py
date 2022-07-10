from PIL import Image

ima = Image.open('cropped.jpeg','r')

pix = ima.load()

f = open("image.bin","w");

l=[]

for i in range(640):
    for j in range(480):
        l.extend(list(pix[i,j]))
print (len(l))
print(l[0])
print(format(l[0],'04b'))
c=0
for i in range(307200*3):
    if c==3:
        f.write("\n")
        c=0
    l[i] = int((l[i] * 16) / 256)
    f.write(format(l[i],'04b'))
    c+=1
f.close()