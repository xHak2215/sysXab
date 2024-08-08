import zipfile
import os

with zipfile.ZipFile("utilits_win_pak.zip","r") as zip_ref:
    zip_ref.extractall()