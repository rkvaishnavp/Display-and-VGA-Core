from PIL import Image

ima = Image.open('./image.jpeg')

box = (280,100,920,580)

ima2 = ima.crop(box)

ima2.save('cropped.jpeg')

ima.close()
ima2.close()