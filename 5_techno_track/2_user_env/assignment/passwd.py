import crypt

if __name__ == '__main__':
    # SHA512 salted passowrd
    result = crypt.crypt('helloworld100500', '$6$Tmdav3f0x34UKDuF$')
    print(result)
    result = crypt.crypt('helloworld100500', '$6$fwf0nWYt$')
    print(result)

