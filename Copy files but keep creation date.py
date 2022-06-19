from os import system
from os.path import getmtime
from glob import glob
from tkinter.filedialog import askdirectory
print('Beep boop!\nSélectionne le dossier contenant les fichiers à déplacer.')
src=askdirectory(title='Dossier source')
assert src
print('Maintenant le dossier de destination.')
dst=askdirectory(title='Dossier de destination')
assert dst
files=glob(src+'/*.*')
files.sort(key=getmtime)
system("robocopy {} {} {} /xx /njh".format(f'"{src}"',f'"{dst}"','*.*'))
