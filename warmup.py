import cv2
from PIL import Image
from blueforest import faceparser

for i in range(0, 4):
  image = cv2.imread(f'resources/testcases/testface{i}.jpg', cv2.IMREAD_COLOR)
  image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
  print(faceparser.parse(Image.fromarray(image)))