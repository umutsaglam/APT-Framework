#!/usr/bin/env python3

import os
import sys
import shutil

if os.path.exists('/data/data/com.termux/files'):
    pass
else:
    if os.geteuid() != 0: 
        exit("Bu betiği çalıştırmak için root olmalısınız.")
        sys.exit()

inp = input('APT-Framework\'i Kaldırmak İstediğinizden Emin Misiniz? (evet/hayır) = ')
if inp.lower() == 'evet' or inp.lower() == 'e':
    if os.path.exists('/data/data/com.termux/files'):
        INSTALL_DIR = "$PREFIX/usr/share/doc/APT-Framework"
        BIN_DIR = "$PREFIX/usr/bin/"
    else:
        INSTALL_DIR = "/usr/share/doc/APT-Framework"
        BIN_DIR = "/usr/bin/"
    
    print(BIN_DIR + 'APT-Framework' + ' Dosyası Siliniyor')
    try:
        os.remove(BIN_DIR + 'APT-Framework')
    except:
        print('Uygulama kaldırılamadı, uygun izinlere sahip olduğunuzdan veya yeniden yükleyip kaldırmak istediğinizden emin olun')
        sys.exit()

    print(INSTALL_DIR + ' Klasörü Siliniyor')
    try:
        shutil.rmtree(INSTALL_DIR)
    except:
        print('Uygulama kaldırılamadı, uygun izinlere sahip olduğunuzdan veya yeniden yükleyip kaldırmak istediğinizden emin olun')
        sys.exit()
    
    print('Kaldırma Başarılı!')

else:
    print('Kaldırma İptal Edildi!')
