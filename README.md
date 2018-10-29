**S-M-R-T SVF2ISO CONVERTER**
===========================
**PROCESS INFO**
------------------------
**CREDITS:**

[mkuba50](https://forums.mydigitallife.net/members/mkuba50.317641/) for the file download script
[Enthousiast](https://forums.mydigitallife.net/members/enthousiast.104688/) for kindly providing the needed SVFs
[BAU](https://forums.mydigitallife.net/members/bau.58504/) for kindly providing the Compress2Txt know-how

**INFO:**

Tool uses the static links for the Enterprise EVAL ISOs to download as source.

Then downloads the SVF to create the en-us Consumer or Business ISO from it.

When source was created properly it will download the SVF for the chosen language
and create the ISO.


In case the Source EVAL/Consumer/Business ISOs (mentioned beneath) are present, the download is skipped, just copy them
to tools folder.





------------------------
**Tutorial for creating MVS Business ISO's using the CMD version:**

Credits:[Enthousiast](https://forums.mydigitallife.net/members/enthousiast.104688/)

1. Start ""svf.iso.converter.aio.cmd":

![Start](https://i.imgur.com/ZeuzRmE.png)

2. Press [M] for MVS iso's:

![MVS_Menu](https://i.imgur.com/2vk6Rxq.png)

3. I select [1] to be able to download the MVS business ISO (17134.1):

    [HEADER] 1803 [17134.1] SVF ISO CONVERSION

    [ USER ] x[6]4 or x[8]6 architecture ?: 6


    [ USER ] [C]onsumer or [B]usiness (VL) ISO ?: B


    Enter chosen language Number.

    Available:

    [01] ar-sa = Arabic [Saudi Arabia]
    [02] bg-bg = Bulgarian [Bulgaria]
    [03] cs-cz = Czech [Czech Republic]
    [04] da-dk = Danish [Denmark]
    [05] de-de = German [Germany]
    [06] el-gr = Greek [Greece]
    [07] en-gb = English [United Kingdom]
    [08] en-us = English [United States]
    [09] es-es = Spanish [Spain]
    [10] es-mx = Spanish [Mexico]
    [11] et-ee = Estonian [Estonia]
    [12] fi-fi = Finnish [Finland]
    [13] fr-ca = French [Canada]
    [14] fr-fr = French [France]
    [15] he-il = Hebrew [Israel]
    [16] hr-hr = Croatian [Croatia]
    [17] hu-hu = Hungarian [Hungary]
    [18] it-it = Italian [Italy]
    [19] ja-jp = Japanese [Japan]
    [20] ko-kr = Korean [Korea]
    [21] lt-lt = Lithuanian [Lithuania]
    [22] lv-lv = Latvian [Latvia]
    [23] nb-no = Norwegian [Norway]
    [24] nl-nl = Dutch [Netherlands]
    [25] pl-pl = Polish [Poland]
    [26] pt-br = Portuguese [Brazil]
    [27] pt-pt = Portuguese [Portugal]
    [28] ro-ro = Romanian [Romania]
    [29] ru-ru = Russian [Russia]
    [30] sr-latn-rs = Serbian [Serbia]
    [31] sk-sk = Slovak [Slovakia]
    [32] sl-si = Slovenian [Slovenia]
    [33] sv-se = Swedish [Sweden]
    [34] th-th = Thai [Thailand]
    [35] tr-tr = Turkish [Turkey]
    [36] uk-ua = Ukrainian [Ukraine]
    [37] zh-cn = Chinese [PRC]
    [38] zh-tw = Chinese [Taiwan]


    [ USER ] Enter Digit One:


4. Select the desired architecture [x86] or [x64], next select either Consumer or Business (VL) ISO
(i've selected Business) and at last select the desired language:

    [HEADER] 1803 [17134.1] SVF ISO CONVERSION

    [ INFO ] Source: 17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us
    [ INFO ] Hash  : a4ea45ec1282e85fc84af49acf7a8d649c31ac5c
    [  TO  ]
    [ INFO ] Source: en_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063333
    [ INFO ] Hash  : 28681742fe850aa4bfc7075811c5244b61d462cf


    [ INFO ] Target: en_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063333
    [ INFO ] Hash  : 28681742fe850aa4bfc7075811c5244b61d462cf


    [ USER ] [S]tart or [B]ack ?:


5. Hit [S]tart:

    [HEADER] 1803 [17134.1] SVF ISO CONVERSION

    [ INFO ] Source: en_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063333
    [ INFO ] Hash  : 28681742fe850aa4bfc7075811c5244b61d462cf


    [ INFO ] Downloading Source ISO (if not already pesent).


    [ INFO ] Downloading Eval ISO.



    10/15 15:06:49 [NOTICE] Downloading 1 item(s)
     *** Download Progress Summary as of Mon Oct 15 15:07:49 2018 ***
    ======================================================================================================================
    [#3ea540 1.1GiB/3.9GiB(29%) CN:16 DL:33MiB ETA:1m24s]
    FILE: K:/17763.1/LTSC/SVF.ISO.CONVERTER-master-f95ce001fc3a8a8b6102c71b134556374319aac5/SVF.ISO.CONVERTER-master-f95ce001fc3a8a8b6102c71b134556374319aac5/17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso
    ----------------------------------------------------------------------------------------------------------------------

     *** Download Progress Summary as of Mon Oct 15 15:08:49 2018 ***
    ======================================================================================================================
    [#3ea540 2.9GiB/3.9GiB(74%) CN:16 DL:28MiB ETA:35s]
    FILE: K:/17763.1/LTSC/SVF.ISO.CONVERTER-master-f95ce001fc3a8a8b6102c71b134556374319aac5/SVF.ISO.CONVERTER-master-f95ce001fc3a8a8b6102c71b134556374319aac5/17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso
    ----------------------------------------------------------------------------------------------------------------------

     *** Download Progress Summary as of Mon Oct 15 15:09:50 2018 ***
    ======================================================================================================================
    [#3ea540 3.9GiB/3.9GiB(100%) CN:0]
    FILE: K:/17763.1/LTSC/SVF.ISO.CONVERTER-master-f95ce001fc3a8a8b6102c71b134556374319aac5/SVF.ISO.CONVERTER-master-f95ce001fc3a8a8b6102c71b134556374319aac5/17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso
    ----------------------------------------------------------------------------------------------------------------------

    [#3ea540 3.9GiB/3.9GiB(100%) CN:0] [Checksum:#3ea540 3.9GiB/3.9GiB(99%)]
    10/15 15:09:59 [NOTICE] Verification finished successfully. file=K:/17763.1/LTSC/SVF.ISO.CONVERTER-master-f95ce001fc3a8a8b6102c71b134556374319aac5/SVF.ISO.CONVERTER-master-f95ce001fc3a8a8b6102c71b134556374319aac5/17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso
    
    10/15 15:09:59 [NOTICE] Download complete: K:/17763.1/LTSC/SVF.ISO.CONVERTER-master-f95ce001fc3a8a8b6102c71b134556374319aac5/SVF.ISO.CONVERTER-master-f95ce001fc3a8a8b6102c71b134556374319aac5/17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso

    Download Results:
    gid   |stat|avg speed  |path/URI
    ======+====+===========+=======================================================
    3ea540|OK  |    26MiB/s|K:/17763.1/LTSC/SVF.ISO.CONVERTER-master-f95ce001fc3a8a8b6102c71b134556374319aac5/SVF.ISO.CONVERTER-master-f95ce001fc3a8a8b6102c71b134556374319aac5/17134.1.180410-1804.rs4_release_CLIENTENTERPRISEEVAL_OEMRET_x64FRE_en-us.iso

    Status Legend:
    (OK):download completed.


    [ INFO ] Downloading Source ISO SVF.
    [ INFO ] Name  : en_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063333


      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
    100  160M  100  160M  100    72  4877k      2  0:00:36  0:00:33  0:00:03 4894k
    curl: Saved to filename 'en_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063333.svf'
    
    
    [ INFO ] Creating Source ISO.
    [ INFO ] Name  : en_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063333
    
    
    Smartversion 3.7 (c) 2002-2018 G. Vollant - http://www.smartversion.com/ - 32 bits
    extracting : en_windows_10_business_editions_version_1803_updated_march_2018_x64_dvd_12063333.iso Done
    
    
    [ INFO ] Checking Source ISO Hash.
    [ INFO ] Hash  : 28681742fe850aa4bfc7075811c5244b61d462cf
    
    
    [ INFO ] ISO Hash matching.
    [ INFO ] Hash  : 28681742fe850aa4bfc7075811c5244b61d462cf
    
    
    Press any key to continue . . .|