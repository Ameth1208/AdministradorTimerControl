
from ctypes import *
import time
import pyautogui as pa 

pa.FAILSAFE=False
time.sleep(5)
pa.press('space')
time.sleep(1)
pa.typewrite('1208')
time.sleep(1)
pa.press('enter')

