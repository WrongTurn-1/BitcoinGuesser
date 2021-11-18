from mnemonic import Mnemonic

mnemo = Mnemonic("english")
x = 0

while x < 15000000:
    print(mnemo.generate(strength=128))
    x += 1
    
