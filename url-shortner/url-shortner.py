# Importing all the libraries
from tkinter import *
import tkinter.messagebox as tkmsg
import PIL
from PIL import ImageTk
from PIL import Image
from tkinter import filedialog
import pyshorteners
import clipboard


# Function to short URL
def convert():
    s = pyshorteners.Shortener().tinyurl.short(url.get())

    Button(root, text="URL Shortened", bg="#F8C471", fg="#1e1e1e", font="poppins 11 bold", command=convert, relief=GROOVE).place(x=8, y=220)

    shorturl.set(s)
    clip = str(s)
    clipboard.copy(s)
    Label(root, text="Shortened URL is copied to clipboard; press Ctrl + V to paste", bg="#49f6b3", fg="#1e1e1e", font="poppins 9").place(x=8, y=360)

    
# Initialzing the tkinter root window
root = Tk()
root.title(" URL Shortner")
root.geometry("400x400")
root.resizable(False, False)
root.wm_iconbitmap("./link.ico")
root.config(background="#4a536b")


image = Image.open('./bg3.png')
test = ImageTk.PhotoImage(image)
label = Label(image=test, bg="#4a536b")
label.pack()


url = StringVar()
shorturl = StringVar()


Label(root, text="Enter URL Here ", bg="#2C3E50", fg="#EAECEE", font="poppins 13 bold", padx=3, pady=1).place(x=7, y=130)

Entry(root, textvariable=url, width=35, font="poppins 12").place(x=7, y=155)


Label(root, text="Shortened URL", bg="#2C3E50", fg="#fff", font="poppins 13 bold", padx=3, pady=1).place(x=8, y=300)

short = Entry(root, textvariable=shorturl, width=35,font="poppins 12")

short.place(x=8, y=325)



Button(root, text="Shorten URL", bg="#F8C471", fg="#1e1e1e", font="poppins 11 bold", command=convert, relief=GROOVE).place(x=8, y=220)

root.mainloop()