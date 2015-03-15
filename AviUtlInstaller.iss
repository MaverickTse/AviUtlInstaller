; ========================================================
; AviUtl Installer Script
; initiated by Maverick Tse (2015)
; File type: Inno Setup Script (Unicode)
; with InternetDownloadPlugin
; ========================================================
; About MinVersion
; 5.1 = WinXP
; 5.1sp3 = WinXP SP3
; 6.1 = Win7
; No need to check for Vista since WinSDK8.1 is incompatible with Vista.
; WinSDK 7 is compatible with both XP and Vista
[Languages]
Name: "en"; MessagesFile: "compiler:Default.isl"; InfoAfterFile: "post_readme_en.txt"; InfoBeforeFile: "pre_readme.txt"
Name: "jp"; MessagesFile: "compiler:Languages\Japanese.isl"; InfoAfterFile: "post_readme_jp_jis.txt"; InfoBeforeFile: "pre_readme_jp_jis.txt"

[Setup]
AppName=AviUtl Extra Pack
AppVersion=1.11
DefaultDirName={sd}\AviUtl
Compression=lzma/ultra
MinVersion=5.1sp3
ArchitecturesInstallIn64BitMode=x64
AppPublisher=MaverickTse,et.al.
AppSupportURL=http://forum.videohelp.com/threads/366724-Aviutl-Tips-Tricks-and-Support-thread

;Internet Download Plugin
#include <idp.iss>
DefaultGroupName=AviUtl
UninstallDisplayName=Uninstall AviUtl
UninstallDisplayIcon={uninstallexe}
AlwaysUsePersonalGroup=True
AppendDefaultGroupName=False

[CustomMessages]
en.StdInst64= Standard for Win7 64bit(English)
jp.StdInst64= 標準 Win7 64bit(日本語)
en.StdInst32= Standard for Win7 32bit(English)
jp.StdInst32= 標準 Win7 32bit(日本語)

en.FullInst64= Full install for Win7 64bit(English)
jp.FullInst64= 全ての物 Win7 64bit(日本語)
en.FullInst32= Full install for Win7 32/64bit(English)
jp.FullInst32= 全ての物 for Win7 32/64bit(日本語)

en.XPInst= Compatibility pack for WinXP/Vista(English)
jp.XPInst= WinXP/Vista 対応(日本語)

en.MinInst= Minimal(English)
jp.MinInst= 基本(日本語)

en.CustInst= Custom Installation
jp.CustInst= 自定義

[Types]
; English
Name: "full"; Description: {cm:FullInst64}; MinVersion: 6.1; Check: IsWin64; Languages: en
Name: "full32"; Description: {cm:FullInst32}; MinVersion: 6.1; Languages: en
Name: "xp"; Description: {cm:XPInst}; MinVersion: 5.1sp3; Languages: en
Name: "compact"; Description: {cm:MinInst}; MinVersion: 5.1; Languages: en
; Japanese
Name: "fulljp"; Description: {cm:FullInst64}; MinVersion: 6.1; Check: IsWin64; Languages: jp
Name: "full32jp"; Description: {cm:FullInst32}; MinVersion: 6.1; Languages: jp
Name: "xpjp"; Description: {cm:XPInst}; MinVersion: 5.1sp3; Languages: jp
Name: "compactjp"; Description: {cm:MinInst}; MinVersion: 5.1; Languages: jp
; Custom
Name: "custom"; Description: {cm:CustInst}; Flags: iscustom

[Components]
; AviUtl.exe :: Large Address Aware needs to be another binary
Name: "base"; Description: AviUtl Main program
Name: "base\LAA"; Flags: exclusive; Description: with LAA support on Win64; Check: IsWin64; Types: full fulljp
Name: "base\ORI"; Flags: exclusive; Description: original for Win32; Types: full32 full32jp xp xpjp compact compactjp
; Language files
Name: "lang"; Description: Extra language files
Name: "lang\en_lucida"; Description: English (Lucida Sans Unicode); Types: full full32 xp compact
Name: "lang\en_gothic"; Description: English (Gothic); Types: full full32 xp compact
; Advanced Editing (拡張編集)
Name: "nle"; Description: NLE Editor
Name: "nle\en"; Description: English UI; Flags: exclusive; Types: full full32 xp compact
Name: "nle\jp"; Description: Japenese UI; Flags: exclusive; Types: fulljp full32jp xpjp compactjp
; Plugins  (all 32 bit)
Name: "plugin"; Description: Optional Plugins
; Import plugins
Name: "plugin\import"; Description: File Import Support
Name: "plugin\import\dsinput"; Description: DirectShow Input; Types: full full32 xp compact fulljp full32jp xpjp compactjp
Name: "plugin\import\lsw"; Description: L-SMASH Works; Types: full full32 xp fulljp full32jp xpjp; Check: SSSE3; ExtraDiskSpaceRequired: 13780577
Name: "plugin\import\csri"; Description: ASS/SSA Subtitle; Types: full full32 fulljp full32jp; ExtraDiskSpaceRequired: 1740360 
Name: "plugin\import\shrink"; Description: AutoShrink Image Reader; Types: full full32 fulljp full32jp; Check: SSSE3; ExtraDiskSpaceRequired: 3383808
; Export plugins
Name: "plugin\export"; Description: File Export Support
;x264GuiEx by rigaya
Name: "plugin\export\x264gui"; Description: x264GuiEx (for AVC/H.264)
Name: "plugin\export\x264gui\en"; Description: English UI; Flags: exclusive; MinVersion: 6.1; Types: full full32; ExtraDiskSpaceRequired: 1075098
Name: "plugin\export\x264gui\jp"; Description: Japanese UI; Flags: exclusive; MinVersion: 6.1; Types: fulljp full32jp; ExtraDiskSpaceRequired: 1069067
Name: "plugin\export\x264gui\enxp"; Description: English UI(WinXP); Flags: exclusive; MinVersion: 5.1sp3; Types: xp; ExtraDiskSpaceRequired: 1074586
Name: "plugin\export\x264gui\jpxp"; Description: Japanese UI(WinXP); Flags: exclusive; MinVersion: 5.1sp3; Types: xpjp; ExtraDiskSpaceRequired: 1074586
;x265GuiEx by rigaya
Name: "plugin\export\x265gui"; Description: x265GuiEx (for HEVC/H.265)
Name: "plugin\export\x265gui\en"; Description: English UI; Flags: exclusive; MinVersion: 6.1; Types: full full32; ExtraDiskSpaceRequired: 1006296
Name: "plugin\export\x265gui\jp"; Description: Japanese UI; Flags: exclusive; MinVersion: 6.1; Types: fulljp full32jp; ExtraDiskSpaceRequired: 1018979
Name: "plugin\export\x265gui\enxp"; Description: English UI(WinXP); Flags: exclusive; MinVersion: 5.1sp3; Types: xp; ExtraDiskSpaceRequired: 1006343 
Name: "plugin\export\x265gui\jpxp"; Description: Japanese UI(WinXP); Flags: exclusive; MinVersion: 5.1sp3; Types: xpjp; ExtraDiskSpaceRequired: 1006343
;ffmpegOut by rigaya
Name: "plugin\export\ffout"; Description: ffmpegOut (encode via FFmpeg)
Name: "plugin\export\ffout\en"; Description: English UI; Flags: exclusive; MinVersion: 6.1; Types: full full32; ExtraDiskSpaceRequired: 755801
Name: "plugin\export\ffout\jp"; Description: Japanese UI; Flags: exclusive; MinVersion: 6.1; Types: fulljp full32jp; ExtraDiskSpaceRequired: 721217
Name: "plugin\export\ffout\enxp"; Description: English UI(WinXP); Flags: exclusive; MinVersion: 5.1sp3; Types: xp; ExtraDiskSpaceRequired: 752247 
Name: "plugin\export\ffout\jpxp"; Description: Japanese UI(WinXP); Flags: exclusive; MinVersion: 5.1sp3; Types: xpjp; ExtraDiskSpaceRequired: 752247
;QSVENc by rigaya
Name: "plugin\export\qsv"; Description: ffmpegOut (encode via FFmpeg)
Name: "plugin\export\qsv\en"; Description: English UI; Flags: exclusive; MinVersion: 6.1; Types: full full32; Check: AVX; ExtraDiskSpaceRequired: 612962
Name: "plugin\export\qsv\jp"; Description: Japanese UI; Flags: exclusive; MinVersion: 6.1; Types: fulljp full32jp; Check: AVX; ExtraDiskSpaceRequired: 663346

;Direct GIF Export 2
Name: "plugin\export\dge2"; Description: Direct GIF Export 2; MinVersion: 6.1; Types: full full32 fulljp full32jp; Check: SSSE3
;=====================================
; Filter Plugins
;=====================================
; De-interlacers
;------------------------------------
Name: "plugin\deinterlace"; Description: De-interlacers
;NNEDI3
Name: "plugin\deinterlace\nnedi3"; Description: NNEDI3 de-interlacer and upscaler
Name: "plugin\deinterlace\nnedi3\en"; Description: English UI; Flags: exclusive; Types: full full32 xp; Check: SSSE3
Name: "plugin\deinterlace\nnedi3\jp"; Description: Japanese UI; Flags: exclusive; Types: fulljp full32jp xpjp; Check:SSSE3
;AFS
Name: "plugin\deinterlace\afs"; Description: Automatic Field Shift Plus
Name: "plugin\deinterlace\afs\en"; Description: English UI; Flags: exclusive; Types: full full32 xp
Name: "plugin\deinterlace\afs\jp"; Description: Japanese UI; Flags: exclusive; Types: fulljp full32jp xpjp
;AFS-VF
Name: "plugin\deinterlace\afsvf"; Description: Automatic Field Shift Plus (VideoFilter)
Name: "plugin\deinterlace\afsvf\en"; Description: English UI; Flags: exclusive; Types: full full32 xp
Name: "plugin\deinterlace\afsvf\jp"; Description: Japanese UI; Flags: exclusive; Types: fulljp full32jp xpjp
;------------------------------------
; Denoisers
;------------------------------------
Name: "plugin\denoise"; Description: Denoisers
;NL-Means for GPU Type-C
Name: "plugin\denoise\nlgpuc"; Description: NL-Means for GPU Type-C; Check: PS30
Name: "plugin\denoise\nlgpuc\en"; Description: English UI; Flags: exclusive; Types: full full32 xp; Check: PS30
Name: "plugin\denoise\nlgpuc\jp"; Description: Japanese UI; Flags: exclusive; Types: fulljp full32jp xpjp; Check: PS30
;NL-Means Light (CPU-only)
Name: "plugin\denoise\nllight"; Description: NL-Means Light
Name: "plugin\denoise\nllight\en"; Description: English UI; Flags: exclusive; Types: full full32 xp
Name: "plugin\denoise\nllight\jp"; Description: Japanese UI; Flags: exclusive; Types: fulljp full32jp xpjp
;PMD-MT
Name: "plugin\denoise\pmdmt"; Description: PMD-MT
Name: "plugin\denoise\pmdmt\en"; Description: English UI; Flags: exclusive; Types: full full32 xp
Name: "plugin\denoise\pmdmt\jp"; Description: Japanese UI; Flags: exclusive; Types: fulljp full32jp xpjp
;Chroma noise removal
Name: "plugin\denoise\chroma"; Description: Chroma Noise removal
Name: "plugin\denoise\chroma\en"; Description: English UI; Flags: exclusive; Types: full full32 xp
Name: "plugin\denoise\chroma\jp"; Description: Japanese UI; Flags: exclusive; Types: fulljp full32jp xpjp
;Wavelet-NR
Name: "plugin\denoise\waveletg"; Description: Wavelet-NR Type-G and Helper
Name: "plugin\denoise\waveletg\en"; Description: English UI; Flags: exclusive; Types: full full32 xp
Name: "plugin\denoise\waveletg\jp"; Description: Japanese UI; Flags: exclusive; Types: fulljp full32jp xpjp
;Ringing Canceller
Name: "plugin\denoise\ring"; Description: Ringing Canceller
Name: "plugin\denoise\ring\en"; Description: English UI; Flags: exclusive; Types: full full32 xp
Name: "plugin\denoise\ring\jp"; Description: Japanese UI; Flags: exclusive; Types: fulljp full32jp xpjp
;------------------------------------
; Image Editing
;------------------------------------
Name: "plugin\edit"; Description: Image Retouching
;logo analysis and transparent logo
Name: "plugin\edit\logo"; Description: Logo Analysis and Removal (Makki)
Name: "plugin\edit\logo\en"; Description: English UI; Types: full full32 xp
Name: "plugin\edit\logo\jp"; Description: Japanese UI; Types: fulljp full32jp xpjp
;Resize filter
Name: "plugin\edit\resize"; Description: Resize filter (SSE2,AVX,AVX2,XOP support)
Name: "plugin\edit\resize\en"; Description: English UI; Types: full full32 xp
Name: "plugin\edit\resize\jp"; Description: Japanese UI; Types: fulljp full32jp xpjp
;Liquid Rescale
Name: "plugin\edit\lqr"; Description: Liquid Rescale (Content-aware rescale)
Name: "plugin\edit\lqr\en"; Description: English UI; Types: full full32 fulljp full32jp; Check: SSSE3; ExtraDiskSpaceRequired: 3989602
;IppRepair:: Image inpainting and repair
Name: "plugin\edit\ipprepair"; Description: IppRepair (Inpainting/Repair)
Name: "plugin\edit\ipprepair\en"; Description: English UI; Types: full full32 fulljp full32jp; Check: SSSE3; ExtraDiskSpaceRequired: 3243618
;ImasUncaption:: Image inpainting and repair
Name: "plugin\edit\imasuncaption"; Description: ImasUncaption (Inpainting/Repair)
Name: "plugin\edit\imasuncaption\en"; Description: English UI; Types: full full32 xp
Name: "plugin\edit\imasuncaption\jp"; Description: Japanese UI(HD hack); Types: fulljp full32jp xpjp
;PS Level
Name: "plugin\edit\pslevel"; Description: Photoshop-like Color Leveling
Name: "plugin\edit\pslevel\en"; Description: English UI; Types: full full32 fulljp full32jp; Check: SSSE3; ExtraDiskSpaceRequired: 928912
;Sigmoidal contrast and brightness
Name: "plugin\edit\sigcolor"; Description: Sigmoidal Contrast and Brigntness
Name: "plugin\edit\sigcolor\en"; Description: English UI; Types: full full32 fulljp full32jp; Check: SSSE3; ExtraDiskSpaceRequired: 925328

;------------------------------------
; MISC
;------------------------------------
Name: "plugin\misc"; Description: Miscellaneous Functions
;Chapter Editing
Name: "plugin\misc\chapter"; Description: Chapter Editing
Name: "plugin\misc\chapter\en"; Description: English UI; Types: full full32 xp
Name: "plugin\misc\chapter\jp"; Description: Japanese UI; Types: fulljp full32jp xpjp
;Magnifying Glass
Name: "plugin\misc\mag"; Description: Magnifying Glass
Name: "plugin\misc\mag\en"; Description: English UI; Types: full full32 xp
Name: "plugin\misc\mag\jp"; Description: Japanese UI; Types: fulljp full32jp xpjp
;Field separation and Weaving
Name: "plugin\misc\field"; Description: Field Separation and Weaving
Name: "plugin\misc\field\en"; Description: English UI; Types: full full32 xp
Name: "plugin\misc\field\jp"; Description: Japanese UI; Types: fulljp full32jp xpjp
;Motion Tracking MK-I
Name: "plugin\misc\mtmk1"; Description: Motion Tracking MK-I(OpenCV2); Types: full full32 fulljp full32jp; Check: SSSE3; ExtraDiskSpaceRequired: 6004297
;Motion Tracking MK-II
Name: "plugin\misc\mtmk2"; Description: Motion Tracking MK-II(OpenCV3-AVX); Check: AVX; ExtraDiskSpaceRequired: 16998445

;=====================================
; Scripts
;=====================================
; Script language should be chosen upon on NLE's language automatically
Name: "script"; Description: Effect Scripts and Custom Objects
Name: "script\satsuki"; Description: Scripts by Satsuki; Types: full full32 xp fulljp full32jp xpjp
Name: "script\tim"; Description: Scripts by Tim; Types: full full32 xp fulljp full32jp xpjp
Name: "script\rikki"; Description: Scripts by Rikki; Types: full full32 xp fulljp full32jp xpjp
Name: "script\mt"; Description: Scripts by MaverickTse; Types: full full32 xp fulljp full32jp xpjp
Name: "script\mt\svg"; Description: SVG Custom Object; Types: full full32 xp fulljp full32jp xpjp
Name: "script\others"; Description: Scripts by various authors; Types: full full32 xp fulljp full32jp xpjp
Name: "script\kirikiri"; Description: "Transition patterns(kikyou.info)"; Types: full full32 xp fulljp full32jp xpjp

;=====================================
; 3rd-Party Tools
;=====================================
Name: "party"; Description: "Third-Party Tools"
Name: "party\ls"; Description: L-SMASH (required by x26XGuiEx); Types: full full32 xp fulljp full32jp xpjp; ExtraDiskSpaceRequired: 2007040
Name: "party\ffmpeg"; Description: FFmpeg (required by ffmpegOut); Types: full full32 xp fulljp full32jp xpjp; ExtraDiskSpaceRequired: 32685568
Name: "party\x264"; Description: x264 AVC video encoder; Types: full full32 xp fulljp full32jp xpjp; ExtraDiskSpaceRequired: 10940416
Name: "party\x265"; Description: x265 HEVC video encoder; Types: full full32 xp fulljp full32jp xpjp; ExtraDiskSpaceRequired: 3230720
Name: "party\qaac"; Description: AAC Audio Encoder (requires iTune); Types: full full32 xp fulljp full32jp xpjp
;Name: "party\neroaac"; Description: AAC Audio Encoder (Nero); Types: full full32 xp fulljp full32jp xpjp
Name: "party\opus"; Description: Opus audio encoder; Types: full full32 xp fulljp full32jp xpjp
Name: "party\ogg"; Description: Ogg audio encoder; Types: full full32 xp fulljp full32jp xpjp
Name: "party\flac"; Description: FLAC audio encoder; Types: full full32 xp fulljp full32jp xpjp
Name: "party\fawcl"; Description: FakeAACWave audio encoder; Types: full full32 xp fulljp full32jp xpjp
Name: "party\mplex"; Description: MJPEG multiplexer; Types: full full32 xp fulljp full32jp xpjp
Name: "party\mkvmerge"; Description: MKVMerge (required to export MKV); Types: full full32 xp fulljp full32jp xpjp; ExtraDiskSpaceRequired: 8744960

;=====================================
; Utilities
;=====================================
Name: "util"; Description: Small Utilities
Name: "util\exo2sub"; Description: Convert EXO to SRT/ASS subtitle; Types: full full32 xp fulljp full32jp xpjp
Name: "util\exostacker"; Description: Merge several EXOs in a top-down manner; Types: full full32 xp fulljp full32jp xpjp
Name: "util\slideshow"; Description: Create EXO with a series of images; Types: full full32 xp fulljp full32jp xpjp
Name: "util\exofps"; Description: Change EXO framerate; Types: full full32 xp fulljp full32jp xpjp
Name: "util\exofps\jp"; Description: Japanese UI; Types: full full32 xp fulljp full32jp xpjp

[Files]
Source: "cputest.dll"; Flags: dontcopy
Source: "haspShader3.dll"; Flags: dontcopy
Source: "7za.exe"; DestDir: "{tmp}"
; License
Source: "readme_srclist\*"; DestDir:"{app}\readme_srclist"; Flags: recursesubdirs createallsubdirs
; AviUtl.exe
Source: "base\aviutl.exe"; DestDir: "{app}"; Components: "base\ORI"
Source: "base\aviutl_LAA.exe"; DestDir: "{app}"; DestName: "aviutl.exe"; Components: "base\LAA"
Source: "base\*.txt"; DestDir: "{app}\readme_srclist"; Components: base\ORI or base\LAA
; Alert Sound
Source: "AlertSound\*"; DestDir:"{app}\AlertSound"
; Exedit
Source: "nle\en\*"; DestDir: "{app}"; Components: "nle\en"; Excludes: "*.txt"
Source: "nle\*.txt"; DestDir: "{app}\readme_srclist"; Components: "nle\en"
Source: "nle\jp\*"; DestDir: "{app}"; Components: "nle\jp"; Excludes: "*.txt"
Source: "nle\*.txt"; DestDir: "{app}\readme_srclist"; Components: "nle\jp"
; Lang
Source: "lang\EnMod_1_5XP.aul"; DestDir: "{app}"; DestName:"EnMod_1_5XP.aul"; Components: "lang\en_lucida"
Source: "lang\EnMod1_5.aul"; DestDir: "{app}"; DestName:"EnMod1_5.aul"; Components: "lang\en_gothic"
Source: "base\aviutl_w7.ini"; DestDir: "{app}"; DestName:"aviutl.ini"; MinVersion: 6.1; Languages: en
Source: "base\aviutl_xp.ini"; DestDir: "{app}"; DestName:"aviutl.ini"; OnlyBelowVersion: 6.1; Languages: en
Source: "base\aviutl_jp.ini"; DestDir: "{app}"; DestName:"aviutl.ini"; Languages: jp
;================================
; Import plugins
;================================

;DirectShow Input
Source: "import_plugin\ds_input\*"; DestDir:"{app}\Plugins"; Components: "plugin\import\dsinput"; Excludes: "*.txt"
Source: "import_plugin\ds_input\*.txt"; DestDir:"{app}\readme_srclist"; Components: "plugin\import\dsinput";

;L-Smash Works (DL)
; See RUN section
;CSRI (DL)
; See RUN section
;AutoShrink (DL)
; See RUN section

;================================
; Export plugins
;================================

;x264EnWin7 (DL)
;x264JpWin7 (DL)
;x264Xp (DL)

;x265EnWin7 (DL)
;x265JpWin7 (DL)
;x265Xp (DL)

;FFEnWin7 (DL)
;FFJpWin7 (DL)
;FFXp (DL)

;QSVEnWin7 (DL)
;QSVJpWin7 (DL)

;DGE2
Source: "export_plugin\dge2\*.auo"; DestDir: "{app}"; Components: "plugin\export\dge2"
Source: "export_plugin\dge2\*.dll"; DestDir: "{app}"; Components: "plugin\export\dge2"
Source: "export_plugin\dge2\*.exe"; DestDir: "{app}\3rdparty"; Components: "plugin\export\dge2"


;================================
; Deinterlacers
;================================
;NNEDI3
Source: "deinterlace_plugin\nnedi3\en\*"; DestDir: "{app}\Plugins"; Components: "plugin\deinterlace\nnedi3\en"; Excludes: "*.txt"
Source: "deinterlace_plugin\nnedi3\en\*.txt"; DestDir: "{app}\readme_srclist"; Components: "plugin\deinterlace\nnedi3\en"
Source: "deinterlace_plugin\nnedi3\jp\*"; DestDir: "{app}\Plugins"; Components: "plugin\deinterlace\nnedi3\jp"; Excludes: "*.txt"
Source: "deinterlace_plugin\nnedi3\jp\*.txt"; DestDir: "{app}\readme_srclist"; Components: "plugin\deinterlace\nnedi3\jp"
;AFS
Source: "deinterlace_plugin\afs\en\*"; DestDir: "{app}\Plugins"; Components: "plugin\deinterlace\afs\en"
Source: "deinterlace_plugin\afs\jp\*"; DestDir: "{app}\Plugins"; Components: "plugin\deinterlace\afs\jp"
;AFS-VF
Source: "deinterlace_plugin\afsvf\en\*"; DestDir: "{app}\Plugins"; Components: "plugin\deinterlace\afsvf\en"
Source: "deinterlace_plugin\afsvf\jp\*"; DestDir: "{app}\Plugins"; Components: "plugin\deinterlace\afsvf\jp"

;================================
; Denoisers
;================================
;NLMeans GPU
Source: "denoise_plugin\nlmeans_gpu\en\*"; DestDir: "{app}\Plugins"; Components: "plugin\denoise\nlgpuc\en"
Source: "denoise_plugin\nlmeans_gpu\jp\*"; DestDir: "{app}\Plugins"; Components: "plugin\denoise\nlgpuc\jp"

;NLMeans Light CPU
Source: "denoise_plugin\nlmeans_light\en\*"; DestDir: "{app}\Plugins"; Components: "plugin\denoise\nllight\en"
Source: "denoise_plugin\nlmeans_light\jp\*"; DestDir: "{app}\Plugins"; Components: "plugin\denoise\nllight\jp"

;PMD-MT
Source: "denoise_plugin\pmdmt\en\pmd_mt_w7.auf"; DestDir: "{app}\Plugins"; DestName: "pmd_mt.auf"; MinVersion: 6.1; Components: "plugin\denoise\pmdmt\en"
Source: "denoise_plugin\pmdmt\jp\*"; DestDir: "{app}\Plugins"; MinVersion: 6.1; Components: "plugin\denoise\pmdmt\jp"
Source: "denoise_plugin\pmdmt\en\pmd_mt_xp.auf"; DestDir: "{app}\Plugins"; DestName: "pmd_mt.auf"; OnlyBelowVersion: 6.1; Components: plugin\denoise\pmdmt\en or plugin\denoise\pmdmt\jp

;Chroma noise
Source: "denoise_plugin\chroma\en\*"; DestDir: "{app}\Plugins"; Components: "plugin\denoise\chroma\en"
Source: "denoise_plugin\chroma\jp\*"; DestDir: "{app}\Plugins"; Components: "plugin\denoise\chroma\jp"

;Wavelet
Source: "denoise_plugin\waveletG\en\*"; DestDir: "{app}\Plugins"; Components: "plugin\denoise\waveletg\en"
Source: "denoise_plugin\waveletG\jp\*"; DestDir: "{app}\Plugins"; Components: "plugin\denoise\waveletg\jp"


;Ringing
Source: "denoise_plugin\ring\en\*"; DestDir: "{app}\Plugins"; Components: "plugin\denoise\ring\en"
Source: "denoise_plugin\ring\jp\*"; DestDir: "{app}\Plugins"; Components: "plugin\denoise\ring\jp"


;================================
; Retouch
;================================
;Logo
Source: "filter_plugin\logo\en\*"; DestDir: "{app}\Plugins"; Components: "plugin\edit\logo\en"
Source: "filter_plugin\logo\jp\*"; DestDir: "{app}\Plugins"; Components: "plugin\edit\logo\jp"

;Resize
Source: "filter_plugin\resize\en\*"; DestDir: "{app}\Plugins"; Components: "plugin\edit\resize\en"
Source: "filter_plugin\resize\jp\*"; DestDir: "{app}\Plugins"; Components: "plugin\edit\resize\jp"
Source: "filter_plugin\resize\DLL\sse2*.dll"; DestDir: "{app}\Plugins\DLL"; Components: plugin\edit\resize\jp or plugin\edit\resize\en
Source: "filter_plugin\resize\DLL\wndfuncs.dll"; DestDir: "{app}\Plugins\DLL"; Components: plugin\edit\resize\jp or plugin\edit\resize\en
Source: "filter_plugin\resize\DLL\avxfilter.dll"; DestDir: "{app}\Plugins\DLL"; Components: plugin\edit\resize\jp or plugin\edit\resize\en; Check: AVX; MinVersion: 6.1
Source: "filter_plugin\resize\DLL\avx2filter.dll"; DestDir: "{app}\Plugins\DLL"; Components: plugin\edit\resize\jp or plugin\edit\resize\en; Check: AVX2; MinVersion: 6.1
Source: "filter_plugin\resize\DLL\xopfilter.dll"; DestDir: "{app}\Plugins\DLL"; Components: plugin\edit\resize\jp or plugin\edit\resize\en; Check: XOP; MinVersion: 6.1

;ImasUncaption (JP-HD version)
Source: "filter_plugin\imas\en\*"; DestDir: "{app}\Plugins"; Components: "plugin\edit\imasuncaption\en"
Source: "filter_plugin\imas\jp\*"; DestDir: "{app}\Plugins"; Components: "plugin\edit\imasuncaption\jp"
;LQR (DL)

;IppRepair (DL)

;PScolor (DL)

;SigCOlor (DL)


;================================
; MISC
;================================
;Chapter
Source: "misc_plugin\chapter\en\*"; DestDir: "{app}\Plugins"; Components: "plugin\misc\chapter\en"
Source: "misc_plugin\chapter\jp\*"; DestDir: "{app}\Plugins"; Components: "plugin\misc\chapter\jp"

;Mag Glass
Source: "misc_plugin\magglass\en\*"; DestDir: "{app}\Plugins"; Components: "plugin\misc\mag\en"
Source: "misc_plugin\magglass\jp\*"; DestDir: "{app}\Plugins"; Components: "plugin\misc\mag\jp"

;Field
Source: "misc_plugin\field\en\*"; DestDir: "{app}\Plugins"; Components: plugin\misc\field\en or plugin\misc\field\jp

;MotionTrack-I (DL)

;MotionTrack-II (DL)

;================================
; DLL Dependency
;================================
;VC2010~VC2013 32bit DLLs
Source: "Dependency\*"; DestDir:"{app}"


;================================
; 3rd Party Tools
;================================
;L-smash(DL)

;FFmpeg(DL)

;x264
Source: "{tmp}\x264_8bpp.exe"; DestDir: "{app}\3rdParty"; Components: party\x264; Flags: external
Source: "{tmp}\x264_10bpp.exe"; DestDir: "{app}\3rdParty"; Components: party\x264; Flags: external
;x265(DL)

;qaac(DL+iTune)

;neroaac(DL)

;opusenc
Source: "party\opusenc.exe"; DestDir: "{app}\3rdparty"; Components: party\opus

;flac
Source: "party\flac.exe"; DestDir: "{app}\3rdparty"; Components: party\flac

;ogg
Source: "party\oggenc2.exe"; DestDir: "{app}\3rdparty"; Components: party\ogg

;mplex
Source: "party\mplex.exe"; DestDir: "{app}\3rdparty"; Components: party\mplex
;fawcl
Source: "party\fawcl.exe"; DestDir: "{app}\3rdparty"; Components: party\fawcl

;mkvmerge(DL)

;================================
; Scripts
;================================
;Satsuki
Source: "script\en\Satsuki\*"; DestDir:"{app}\Scripts\Satsuki"; Components: script\satsuki and nle\en
Source: "script\jp\Satsuki\*"; DestDir:"{app}\Scripts\Satsuki"; Components: script\satsuki and nle\jp
Source: "script\jp\Satsuki_ANM\*"; DestDir:"{app}\Scripts\Satsuki_ANM"; Components: script\satsuki and nle\jp
Source: "script\jp\Satsuki_TA\*"; DestDir:"{app}\Scripts\Satsuki_TA"; Components: script\satsuki and nle\jp
;TIM
Source: "script\en\TIM\*"; DestDir:"{app}\Scripts\TIM"; Components: script\tim and nle\en
Source: "script\jp\TIM\*"; DestDir:"{app}\Scripts\TIM"; Components: script\tim and nle\jp
;Rikki
Source: "script\en\Rikki\*"; DestDir:"{app}\Scripts\Rikki"; Components: script\rikki and nle\en
Source: "script\jp\Rikki\*"; DestDir:"{app}\Scripts\Rikki"; Components: script\rikki and nle\jp
;Others
Source: "script\en\Others\*"; DestDir:"{app}\Scripts\Others"; Components: script\others and nle\en
Source: "script\jp\Others\*"; DestDir:"{app}\Scripts\Others"; Components: script\others and nle\jp
;SVG
Source: "script\en\SVG\*.dll"; DestDir:"{app}"; Components: script\mt\svg and nle\en
Source: "script\en\SVG\script\*"; DestDir:"{app}\Scripts\SVG"; Components: script\mt\svg and nle\en
Source: "script\jp\SVG\*.dll"; DestDir:"{app}"; Components: script\mt\svg and nle\jp
Source: "script\jp\SVG\script\*"; DestDir:"{app}\Scripts\SVG"; Components: script\mt\svg and nle\jp
;KiriKiri scene change
Source: "kirikiri\en\*"; DestDir: "{app}\Transition"; Components: script\kirikiri and nle\en
Source: "kirikiri\jp\*"; DestDir: "{app}\Transition"; Components: script\kirikiri and nle\jp

;================================
; Utils
;================================
;EXO2Sub
Source: "util\EXO2Subs\Samples\*"; DestDir:"{app}\Utilities\EXO2Sub\Samples"; Components: util\exo2sub
Source: "util\EXO2Subs\Scripts\*"; DestDir:"{app}\Utilities\EXO2Sub\Scripts"; Components: util\exo2sub
Source: "util\EXO2Subs\*.txt"; DestDir:"{app}\Utilities\EXO2Sub"; Components: util\exo2sub
;Stacker
Source: "util\EXOStacker.exe"; DestDir:"{app}\Utilities"; Components: util\exostacker
;SlideShow
Source: "util\SlideShowHelperEN.exe"; DestDir:"{app}\Utilities"; Components: util\slideshow
;FPS
Source: "util\AviUtl_ExoExpander.exe"; DestDir:"{app}\Utilities"; Components: util\exofps\jp
[Run]
;L-Smash Works
Filename: "{tmp}\7za.exe"; Parameters: "e -y -o""{app}\Plugins"" ""{tmp}\LSW.7z"""; Components: "plugin\import\lsw"; Flags: runhidden
;CSRI Subtitle Reader
Filename: "{tmp}\7za.exe"; Parameters: "e -y -o""{app}"" ""{tmp}\csri.7z"""; Components: "plugin\import\csri"; Flags: runhidden
;AutoShrink Image Reader
Filename: "{tmp}\7za.exe"; Parameters: "e -y -o""{app}"" ""{tmp}\shrink.7z"""; Components: "plugin\import\shrink"; Flags: runhidden
;x264GuiEx
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}\Plugins"" ""{tmp}\x264gui.7z"""; Components: "plugin\export\x264gui\en"; Flags: runhidden
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}\Plugins"" ""{tmp}\x264gui.7z"""; Components: "plugin\export\x264gui\jp"; Flags: runhidden
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}\Plugins"" ""{tmp}\x264gui.7z"""; Components: "plugin\export\x264gui\enxp"; Flags: runhidden
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}\Plugins"" ""{tmp}\x264gui.7z"""; Components: "plugin\export\x264gui\jpxp"; Flags: runhidden
;x265GuiEx
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}\Plugins"" ""{tmp}\x265gui.7z"""; Components: "plugin\export\x265gui\en"; Flags: runhidden
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}\Plugins"" ""{tmp}\x265gui.7z"""; Components: "plugin\export\x265gui\jp"; Flags: runhidden
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}\Plugins"" ""{tmp}\x265gui.7z"""; Components: "plugin\export\x265gui\enxp"; Flags: runhidden
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}\Plugins"" ""{tmp}\x265gui.7z"""; Components: "plugin\export\x265gui\jpxp"; Flags: runhidden
;FFmpegOut
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}\Plugins"" ""{tmp}\ffout.7z"""; Components: "plugin\export\ffout\en"; Flags: runhidden
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}\Plugins"" ""{tmp}\ffout.7z"""; Components: "plugin\export\ffout\jp"; Flags: runhidden
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}\Plugins"" ""{tmp}\ffout.7z"""; Components: "plugin\export\ffout\enxp"; Flags: runhidden
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}\Plugins"" ""{tmp}\ffout.7z"""; Components: "plugin\export\ffout\jpxp"; Flags: runhidden
;QSVEnc
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}\Plugins"" ""{tmp}\qsv.7z"""; Components: "plugin\export\qsv\en"; Flags: runhidden
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}\Plugins"" ""{tmp}\qsv.7z"""; Components: "plugin\export\qsv\jp"; Flags: runhidden
;LQR
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}"" ""{tmp}\lqr.7z"""; Components: "plugin\edit\lqr\en"; Flags: runhidden
;PSLevel
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}"" ""{tmp}\pslevel.7z"""; Components: "plugin\edit\pslevel\en"; Flags: runhidden
;SigColor
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}"" ""{tmp}\sigcolor.7z"""; Components: "plugin\edit\sigcolor\en"; Flags: runhidden
;IppRepair
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}"" ""{tmp}\ipprepair.7z"""; Components: "plugin\edit\ipprepair\en"; Flags: runhidden
;MotionTracking MK-I
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}"" ""{tmp}\mtmk1.7z"""; Components: "plugin\misc\mtmk1"; Flags: runhidden
;MotionTracking MK-II
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}"" ""{tmp}\mtmk2.7z"""; Components: "plugin\misc\mtmk2"; Flags: runhidden
;L-Smash
Filename: "{tmp}\7za.exe"; Parameters: "x -y -o""{app}\3rdParty"" ""{tmp}\ls.7z"""; Components: "party\ls"; Flags: runhidden
;FFmpeg
Filename: "{tmp}\7za.exe"; Parameters: "e -y ""{tmp}\ffmpeg.7z"" -o""{app}\3rdParty"" *.exe -r"; Components: "party\ffmpeg"; Flags: runhidden
;x264
;(EXE only, use File section)
;x265
Filename: "{tmp}\7za.exe"; Parameters: "e -y ""{tmp}\x265_8bpp.zip"" -o""{app}\3rdParty"" *.exe -r"; Components: "party\x265"; Flags: runhidden
Filename: "{tmp}\7za.exe"; Parameters: "e -y ""{tmp}\x265_16bpp.zip"" -o""{app}\3rdParty"" *.exe -r"; Components: "party\x265"; Flags: runhidden
;qaac
Filename: "{tmp}\7za.exe"; Parameters: "x -y ""{tmp}\qaac.7z"" -o""{app}\3rdParty"""; Components: "party\qaac"; Flags: runhidden
Filename: "{tmp}\7za.exe"; Parameters: "e -y ""{tmp}\iTune.exe"" -o""{tmp}\iTune"" *.msi -r"; Components: "party\qaac"; Flags: runhidden
Filename: "msiexec"; Parameters: "/passive /i ""{tmp}\iTune\AppleApplicationSupport.msi"""; Components: "party\qaac"
;NeroAAC
;Filename: "{tmp}\7za.exe"; Parameters: "e -y ""{tmp}\neroaac.zip"" -o""{app}\3rdParty"" *.exe -r"; Components: "party\neroaac"; Flags: runhidden

;MKV
Filename: "{tmp}\7za.exe"; Parameters: "e -y ""{tmp}\mkv.7z"" -o""{app}\3rdParty"""; Components: "party\mkvmerge"; Flags: runhidden
;
;Finally move all TXT from root and Plugins to ./readme_srclist
Filename: "{cmd}"; Parameters: "/C move /Y ""{app}\*.txt""  ""{app}\readme_srclist"""; Flags: runhidden waituntilterminated
Filename: "{cmd}"; Parameters: "/C move /Y ""{app}\Plugins\*.txt""  ""{app}\readme_srclist"""; Flags: runhidden waituntilterminated
Filename: "{cmd}"; Parameters: "/C move /Y ""{app}\Transition\*.txt""  ""{app}\readme_srclist"""; Flags: runhidden waituntilterminated
Filename: "{cmd}"; Parameters: "/C move /Y ""{app}\3rdParty\*.txt""  ""{app}\readme_srclist"""; Flags: runhidden waituntilterminated
[Tasks]
Name: desktopicon; Description: "Create a &desktop icon"; GroupDescription:"Make ShortCuts:"; Components: base\LAA or base\ORI; Flags: unchecked
Name: fourK; Description: Make AviUtl handles 4K video (default only handles up to FullHD); Components: base\LAA or base\ORI; Flags: unchecked
[ICONS]
Name: "{userdesktop}\AviUtl(EN)"; Filename: "{app}\aviutl.exe"; WorkingDir:"{app}"; Comment:"AviUtl in English"; IconFilename: "{app}\aviutl.exe"; Languages: en; Tasks: desktopicon; Components: lang\en_lucida or lang\en_gothic
Name: "{group}\AviUtl(EN)"; Filename: "{app}\aviutl.exe"; WorkingDir:"{app}"; Comment:"AviUtl in English"; IconFilename: "{app}\aviutl.exe"; Languages: en; Tasks: desktopicon; Components: lang\en_lucida or lang\en_gothic
Name: "{userdesktop}\AviUtl(日本語)"; Filename: "{app}\aviutl.exe"; WorkingDir:"{app}"; Comment:"AviUtl 日本語版"; IconFilename: "{app}\aviutl.exe"; Languages: jp; Tasks: desktopicon; Components: not (lang\en_lucida or lang\en_gothic)
Name: "{group}\AviUtl(日本語)"; Filename: "{app}\aviutl.exe"; WorkingDir:"{app}"; Comment:"AviUtl 日本語版"; IconFilename: "{app}\aviutl.exe"; Languages: jp; Tasks: desktopicon; Components: not (lang\en_lucida or lang\en_gothic)
Name: "{group}\Uninstall AviUtl"; Filename:"{uninstallexe}"
[INI]
Filename:"{app}\aviutl.ini"; Section:"system"; Key:"width"; String:"4096"; Tasks: fourK
Filename:"{app}\aviutl.ini"; Section:"system"; Key:"height"; String:"2160"; Tasks: fourK
Filename:"{app}\aviutl.ini"; Section:"system"; Key:"resource"; String:""; Components: not (lang\en_lucida or lang\en_gothic)

[UninstallDelete]
Type: files; Name: "{app}\Plugins\*"
Type: files; Name: "{app}\3rdParty\*"
Type: files; Name: "{app}\readme_srclist\*"
Type: dirifempty; Name: "{app}\Plugins"
Type: dirifempty; Name: "{app}\3rdParty"
Type: dirifempty; Name: "{app}\readme_srclist"
Type: files; Name: "{app}\*.aui"
Type: files; Name: "{app}\*.auf"
[Code]

//importing an ANSI Windows API function
function MessageBox(hWnd: Integer; lpText, lpCaption: AnsiString; uType: Cardinal): Integer;
external 'MessageBoxA@user32.dll stdcall';

function hasSSE2(): Boolean;
external 'hasSSE2@files:cputest.dll stdcall';

function hasSSSE3(): Boolean;
external 'hasSSSE3@files:cputest.dll stdcall';

function hasAVX(): Boolean;
external 'hasAVX@files:cputest.dll stdcall';

function hasAVX2(): Boolean;
external 'hasAVX2@files:cputest.dll stdcall';

function hasXOP(): Boolean;
external 'hasXOP@files:cputest.dll stdcall';

function hasPS30(): Boolean;
external 'hasPixelShader3@files:haspShader3.dll stdcall';

function SSE2: Boolean;
begin
  if hasSSE2() then
  Result := True
  else
  Result := False;
end;

function SSSE3: Boolean;
begin
  if hasSSSE3() then
  Result := True
  else
  Result := False;
end;

function AVX: Boolean;
begin
  if hasAVX() then
  Result := True
  else
  Result := False;
end;

function AVX2: Boolean;
begin
  if hasAVX2() then
  Result := True
  else
  Result := False;
end;

function XOP: Boolean;
begin
  if hasXOP() then
  Result := True
  else
  Result := False;
end;

function PS30: Boolean;
begin
  if hasPS30() then
  Result := True
  else
  Result := False;
end;

procedure InitializeWizard;
begin
    idpDownloadAfter(wpReady);
end;

procedure CurPageChanged(CurPageID: Integer);
begin
    if CurPageID = wpReady then
    begin
        // User can navigate to 'Ready to install' page several times, so we 
        // need to clear file list to ensure that only needed files are added.
        idpClearFiles;
        // IMPORT PLUGINS
        if IsComponentSelected('plugin\import\lsw') then
            idpAddFile('https://www.dropbox.com/s/5mz0bemrvgsy5pn/LSW.7z?dl=1', ExpandConstant('{tmp}\LSW.7z'));
        if IsComponentSelected('plugin\import\csri') then
            idpAddFile('https://www.dropbox.com/s/2m7mxbw547ij0cw/CSRI.7z?dl=1', ExpandConstant('{tmp}\csri.7z'));
        if IsComponentSelected('plugin\import\shrink') then
            idpAddFile('https://www.dropbox.com/s/v5fc50nm7hwz0yu/AutoShrink.7z?dl=1', ExpandConstant('{tmp}\shrink.7z'));
        // EXPORT PLUGIN
        // x264GuiEx
        if IsComponentSelected('plugin\export\x264gui\en') then
            idpAddFile('https://www.dropbox.com/s/n888xsik8rjk742/x264guiExEn.7z?dl=1', ExpandConstant('{tmp}\x264gui.7z'));
        if IsComponentSelected('plugin\export\x264gui\jp') then
            idpAddFile('https://www.dropbox.com/s/b7gfn99zk2xlvus/x264guiExJp.7z?dl=1', ExpandConstant('{tmp}\x264gui.7z'));
        if IsComponentSelected('plugin\export\x264gui\enxp') then
            idpAddFile('https://www.dropbox.com/s/yzn949vi6skolch/x264guiXP.7z?dl=1', ExpandConstant('{tmp}\x264gui.7z'));
        if IsComponentSelected('plugin\export\x264gui\jpxp') then
            idpAddFile('https://www.dropbox.com/s/yzn949vi6skolch/x264guiXP.7z?dl=1', ExpandConstant('{tmp}\x264gui.7z'));
        // x265GuiEx
        if IsComponentSelected('plugin\export\x265gui\en') then
            idpAddFile('https://www.dropbox.com/s/dijd7fh8xj0vbo7/x265guiExEn.7z?dl=1', ExpandConstant('{tmp}\x265gui.7z'));
        if IsComponentSelected('plugin\export\x265gui\jp') then
            idpAddFile('https://www.dropbox.com/s/432ajbpkfj61f4r/x265guiExJp.7z?dl=1', ExpandConstant('{tmp}\x265gui.7z'));
        if IsComponentSelected('plugin\export\x265gui\enxp') then
            idpAddFile('https://www.dropbox.com/s/d5xi97osqop9zjg/x265guiXP.7z?dl=1', ExpandConstant('{tmp}\x265gui.7z'));
        if IsComponentSelected('plugin\export\x265gui\jpxp') then
            idpAddFile('https://www.dropbox.com/s/d5xi97osqop9zjg/x265guiXP.7z?dl=1', ExpandConstant('{tmp}\x265gui.7z'));
        // FFmpegOut
        if IsComponentSelected('plugin\export\ffout\en') then
            idpAddFile('https://www.dropbox.com/s/phak9slrmqwij6w/ffoutEn.7z?dl=1', ExpandConstant('{tmp}\ffout.7z'));
        if IsComponentSelected('plugin\export\ffout\jp') then
            idpAddFile('https://www.dropbox.com/s/nqqpvza1hsv40xw/ffoutJp.7z?dl=1', ExpandConstant('{tmp}\ffout.7z'));
        if IsComponentSelected('plugin\export\ffout\enxp') then
            idpAddFile('https://www.dropbox.com/s/ley23n305bv7yuv/ffoutXP.7z?dl=1', ExpandConstant('{tmp}\ffout.7z'));
        if IsComponentSelected('plugin\export\ffout\jpxp') then
            idpAddFile('https://www.dropbox.com/s/ley23n305bv7yuv/ffoutXP.7z?dl=1', ExpandConstant('{tmp}\ffout.7z'));
        // QSVEnc
        if IsComponentSelected('plugin\export\qsv\en') then
            idpAddFile('https://www.dropbox.com/s/7zzl0hme9zzmwz8/QSVEncEn.7z?dl=1', ExpandConstant('{tmp}\qsv.7z'));
        if IsComponentSelected('plugin\export\qsv\jp') then
            idpAddFile('https://www.dropbox.com/s/joyfo560o92511p/QSVEncJp.7z?dl=1', ExpandConstant('{tmp}\qsv.7z'));
        // RETOUCHING
        // LQR
        if IsComponentSelected('plugin\edit\lqr\en') then
            idpAddFile('https://www.dropbox.com/s/5qt7phpvftah2ph/LQR.7z?dl=1', ExpandConstant('{tmp}\lqr.7z'));
        // PSLevel
        if IsComponentSelected('plugin\edit\pslevel\en') then
            idpAddFile('https://www.dropbox.com/s/h7ylb8ctbi5ker3/pslevel.7z?dl=1', ExpandConstant('{tmp}\pslevel.7z'));
        // SigColor
        if IsComponentSelected('plugin\edit\sigcolor\en') then
            idpAddFile('https://www.dropbox.com/s/vusu0ouokmm4rrd/sigcolor.7z?dl=1', ExpandConstant('{tmp}\sigcolor.7z'));
        // IppRepair
        if IsComponentSelected('plugin\edit\ipprepair\en') then
            idpAddFile('https://www.dropbox.com/s/5krk2oiy0ieb21s/ipprepair.7z?dl=1', ExpandConstant('{tmp}\ipprepair.7z'));

        // MISC
        // MotionTracking MK-I
        if IsComponentSelected('plugin\misc\mtmk1') then
            idpAddFile('https://www.dropbox.com/s/j3jc8xgzkyzj2nw/mtmk1.7z?dl=1', ExpandConstant('{tmp}\mtmk1.7z'));
        // MotionTracking MK-II
        if IsComponentSelected('plugin\misc\mtmk2') then
            idpAddFile('https://www.dropbox.com/s/m49ih04z0giuwc8/mtmk2.7z?dl=1', ExpandConstant('{tmp}\mtmk2.7z'));
        // 3rd Party
        // L-Smash
        if IsComponentSelected('party\ls') then
            idpAddFile('https://www.dropbox.com/s/z45u2v5t8gj9ace/LSmash32.7z?dl=1', ExpandConstant('{tmp}\ls.7z'));
        // Zeranoe FFmpeg
        if IsComponentSelected('party\ffmpeg') then
        begin
        if (Not IsWin64) then
            begin
            idpAddFile('http://ffmpeg.zeranoe.com/builds/win32/static/ffmpeg-latest-win32-static.7z', ExpandConstant('{tmp}\ffmpeg.7z'));
            end
        else
            begin
            idpAddFile('http://ffmpeg.zeranoe.com/builds/win64/static/ffmpeg-latest-win64-static.7z', ExpandConstant('{tmp}\ffmpeg.7z'));
            end;
        end;
        // x264
        if IsComponentSelected('party\x264') then
        begin
        if (Not IsWin64) then
            begin
            idpAddFile('http://komisar.gin.by/old/2538/x264.2538kMod.x86.exe', ExpandConstant('{tmp}\x264_8bpp.exe'));
            idpAddFile('http://komisar.gin.by/old/2538/x264.2538kMod.10bit.x86.exe', ExpandConstant('{tmp}\x264_10bpp.exe'));
            end
        else
            begin
            idpAddFile('http://komisar.gin.by/old/2538/x264.2538kMod.x86_64.exe', ExpandConstant('{tmp}\x264_8bpp.exe'));
            idpAddFile('http://komisar.gin.by/old/2538/x264.2538kMod.10bit.x86_64.exe', ExpandConstant('{tmp}\x264_10bpp.exe'));
            end;
        end;
        // x265
        if IsComponentSelected('party\x265') then
        begin
        if (Not IsWin64) then
            begin
            idpAddFile('http://x265.ru/soft/x265/ICC/x265[icc]_1.5+200.zip', ExpandConstant('{tmp}\x265_8bpp.zip'));
            idpAddFile('http://x265.ru/soft/x265/ICC/x265[icc]_1.5+129_16bpp.zip', ExpandConstant('{tmp}\x265_10bpp.zip'));
            end
        else
            begin
            idpAddFile('http://x265.ru/soft/x265/ICC/x265[icc]_1.5+200_64.zip', ExpandConstant('{tmp}\x265_8bpp.zip'));
            idpAddFile('http://x265.ru/soft/x265/ICC/x265[icc]_1.5+200_64_16bpp.zip', ExpandConstant('{tmp}\x265_16bpp.zip'));
            end;
        end;
        // qaac
        if IsComponentSelected('party\qaac') then
        begin
            idpAddFile('https://www.dropbox.com/s/rdjebx0lqog0j6m/qaac.7z?dl=1', ExpandConstant('{tmp}\qaac.7z'));
            idpAddFile('https://secure-appldnld.apple.com/itunes12/031-17457.20150218.FFCRg/iTunesSetup.exe', ExpandConstant('{tmp}\iTune.exe'));
        end;
        // NeroAAC (@videohelp)
        //if IsComponentSelected('party\neroaac') then
            //idpAddFile('http://www.videohelp.com/download/NeroAACCodec-1.5.1.zip', ExpandConstant('{tmp}\neroaac.zip'));
        // mkvmerge
        if IsComponentSelected('party\mkvmerge') then
        begin
        if (Not IsWin64) then
            begin
            idpAddFile('https://www.dropbox.com/s/rtcwqbk9160acfi/mkvmerge.7z?dl=1', ExpandConstant('{tmp}\mkv.7z'));
            end
        else
            begin
            idpAddFile('https://www.dropbox.com/s/cmfev5cppkhktyr/mkvmerge64.7z?dl=1', ExpandConstant('{tmp}\mkv.7z'));
            end;
        end;
        //
  end;
end;



