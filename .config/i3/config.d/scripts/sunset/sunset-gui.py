#!/usr/bin/python
# baby 1st python script
# needs pip install pystray
# needs pip install schedule

import os
import sys
import json
import schedule
import time
from threading import Thread
import pystray
from pystray import Icon as icon, Menu as menu, MenuItem as item
from PIL import Image

PROGDIR=os.path.dirname(os.path.realpath(__file__))
PROGCONFIGDIR= PROGDIR + '/config'
PROGCONFIGFILE= PROGCONFIGDIR + '/gui-config.json'
PROGLOGFILE= PROGDIR + '/sunset.log'

def lightTheme():
  # loads config.json into f
  with open(PROGCONFIGFILE, 'r') as f:
    configs = json.load(f)

  # loads json values into vars
  sunsetLocation = configs['sunsetLocation']
  lightThemeName = configs['lightTheme']
  lightThemeSetting = configs['lightThemeSetting']

  # sends info to sunset
  os.system("bash "+ sunsetLocation + " " + lightThemeSetting  + " " + lightThemeName)

  # closes config.json
  f.close()

def darkTheme():
  # loads config.json into f
  with open(PROGCONFIGFILE, 'r') as f:
    configs = json.load(f)

  # loads json values into vars
  sunsetLocation = configs['sunsetLocation']
  darkThemeName = configs['darkTheme']
  darkThemeSetting = configs['darkThemeSetting']

  # sends info to sunset
  os.system("bash "+ sunsetLocation + " " + darkThemeSetting + " " + darkThemeName)

  # closes config.json
  f.close()

def editConfig():
  os.system("kitty nano " + PROGCONFIGFILE)

def openLog():
  os.system("kitty nano " + PROGLOGFILE)

def scheduleFunction():
  while True:
    schedule.run_pending()
    time.sleep(1)

def iconTrayFunction():
  icon.run()

def test():
  now = datetime.now()
  print(now)

def quit():
  print('Quitting...')
  # https://stackoverflow.com/a/1489838
  # exit and kill all threads
  os._exit(1)

if __name__ == "__main__":

  image = Image.open(PROGCONFIGDIR + "/icon.png")
  menu = (item('Light theme', lightTheme),
          item('Dark Theme', darkTheme),
          item('More...', menu(
            item('Edit config',editConfig),
            item('Open log',openLog),
            item('Exit',quit))))

  icon = pystray.Icon("sunset", image, "sunset", menu)

  schedule.every().day.at("10:00").do(lightTheme)
  schedule.every().day.at("18:00").do(darkTheme)

  # creates threads
  scheduleThread = Thread(target=scheduleFunction)
  trayIconThread = Thread(target=iconTrayFunction)

  # start threads
  scheduleThread.start()
  trayIconThread.start()

  # wait for thread completion
  scheduleThread.join()
  trayIconThread.join()
