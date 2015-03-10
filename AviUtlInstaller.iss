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
Name: "en"; MessagesFile: "compiler:Default.isl"
Name: "jp"; MessagesFile: "compiler:Languages\Japanese.isl"

[Setup]
AppName=AviUtl English Extra Pack
AppVersion=1.11
DefaultDirName={sd}\AviUtl
DefaultGroupName=AviUtl
Compression=lzma/ultra
MinVersion=5.1sp3
;ArchitecturesInstallIn64BitMode=x64
AppPublisher=KenÇ≠ÇÒ,Muken,MaverickTse,et.al.
AppSupportURL=http://forum.videohelp.com/threads/366724-Aviutl-Tips-Tricks-and-Support-thread

;Å´Internet Download Plugin
#include <idp.iss>

[Types]
; English
Name: "full"; Description: "Full install for Win7 64bit(English)"; MinVersion: 6.1; Check: IsWin64
Name: "full32"; Description: "Full install for Win7 32/64bit(English)"; MinVersion: 6.1
Name: "xp"; Description: "Compatibility pack for WinXP/Vista(English)"; MinVersion: 5.1sp3
Name: "compact"; Description: "Minimal(English)"; MinVersion: 5.1
; Japanese
Name: "fulljp"; Description: "Full install for Win7 64bit(Japanese)"; MinVersion: 6.1; Check: IsWin64; Languages: jp
Name: "full32jp"; Description: "Full install for Win7 32/64bit(Japanese)"; MinVersion: 6.1; Languages: jp
Name: "xpjp"; Description: "Compatibility pack for WinXP/Vista(Japanese)"; MinVersion: 5.1sp3; Languages: jp
Name: "compactjp"; Description: "Minimal(Japanese)"; MinVersion: 5.1; Languages: jp
; Custom
Name: "custom"; Description: "Custom Installation"; Flags: iscustom

[Components]
; AviUtl.exe :: Large Address Aware needs to be another binary
Name: "base"; Description: AviUtl Main program
Name: "base\LAA"; Flags: exclusive; Description: with LAA support on Win64; Check: IsWin64; Types: full fulljp
Name: "base\ORI"; Flags: exclusive; Description: original for Win32; Types: full32 full32jp xp xpjp compact compactjp
; Language files
Name: "lang"; Description: Extra language files
Name: "lang\en_lucida"; Description: English (Lucida Sans Unicode); Types: full full32 xp compact
Name: "lang\en_gothic"; Description: English (Gothic); Types: full full32 xp compact
; Advanced Editing (ägí£ï“èW)
Name: "nle"; Description: NLE Editor
Name: "nle\en"; Description: English UI; Flags: exclusive; Types: full full32 xp compact
Name: "nle\jp"; Description: Japenese UI; Flags: exclusive; Types: fulljp full32jp xpjp compactjp
; Plugins  (all 32 bit)
Name: "plugin"; Description: Optional Plugins
; Import plugins
Name: "plugin\import"; Description: File Import Support
Name: "plugin\import\dsinput"; Description: DirectShow Input; Types: full full32 xp compact fulljp full32jp xpjp compactjp
Name: "plugin\import\lsw"; Description: L-Smash Works; Types: full full32 xp fulljp full32jp xpjp
Name: "plugin\import\csri"; Description: ASS/SSA Subtitle; Types: full full32 fulljp full32jp
Name: "plugin\import\shrink"; Description: AutoShrink Image Reader; Types: full full32 fulljp full32jp
; Export plugins
Name: "plugin\export"; Description: File Export Support
;x264GuiEx by rigaya
Name: "plugin\export\x264gui"; Description: x264GuiEx (for AVC/H.264)
Name: "plugin\export\x264gui\en"; Description: English UI; Flags: exclusive; MinVersion: 6.1; Types: full full32
Name: "plugin\export\x264gui\jp"; Description: Japanese UI; Flags: exclusive; MinVersion: 6.1; Types: fulljp full32jp
Name: "plugin\export\x264gui\enxp"; Description: English UI(WinXP); Flags: exclusive; MinVersion: 5.1sp3; Types: xp
Name: "plugin\export\x264gui\jpxp"; Description: Japanese UI(WinXP); Flags: exclusive; MinVersion: 5.1sp3; Types: xpjp
;x265GuiEx by rigaya
Name: "plugin\export\x265gui"; Description: x265GuiEx (for HEVC/H.265)
Name: "plugin\export\x265gui\en"; Description: English UI; Flags: exclusive; MinVersion: 6.1; Types: full full32
Name: "plugin\export\x265gui\jp"; Description: Japanese UI; Flags: exclusive; MinVersion: 6.1; Types: fulljp full32jp
Name: "plugin\export\x265gui\enxp"; Description: English UI(WinXP); Flags: exclusive; MinVersion: 5.1sp3; Types: xp
Name: "plugin\export\x265gui\jpxp"; Description: Japanese UI(WinXP); Flags: exclusive; MinVersion: 5.1sp3; Types: xpjp
;ffmpegOut by rigaya
Name: "plugin\export\ffout"; Description: ffmpegOut (encode via FFmpeg)
Name: "plugin\export\ffout\en"; Description: English UI; Flags: exclusive; MinVersion: 6.1; Types: full full32
Name: "plugin\export\ffout\jp"; Description: Japanese UI; Flags: exclusive; MinVersion: 6.1; Types: fulljp full32jp
Name: "plugin\export\ffout\enxp"; Description: English UI(WinXP); Flags: exclusive; MinVersion: 5.1sp3; Types: xp
Name: "plugin\export\ffout\jpxp"; Description: Japanese UI(WinXP); Flags: exclusive; MinVersion: 5.1sp3; Types: xpjp
;Direct GIF Export 2
Name: "plugin\export\dge2"; Description: Direct GIF Export 2; MinVersion: 6.1; Types: full full32 fulljp full32jp
;=====================================
; Filter Plugins
;=====================================
; De-interlacers
;------------------------------------
Name: "plugin\deinterlace"; Description: De-interlacers
;NNEDI3
Name: "plugin\deinterlace\nnedi3"; Description: NNEDI3 de-interlacer and upscaler
Name: "plugin\deinterlace\nnedi3\en"; Description: English UI; Flags: exclusive; Types: full full32 xp
Name: "plugin\deinterlace\nnedi3\jp"; Description: Japanese UI; Flags: exclusive; Types: fulljp full32jp xpjp
;AFS
Name: "plugin\deinterlace\afs"; Description: Automatic Filed Shift Plus
Name: "plugin\deinterlace\afs\en"; Description: English UI; Flags: exclusive; Types: full full32 xp
Name: "plugin\deinterlace\afs\jp"; Description: Japanese UI; Flags: exclusive; Types: fulljp full32jp xpjp
;AFS-VF
Name: "plugin\deinterlace\afsvf"; Description: Automatic Filed Shift Plus (VideoFilter)
Name: "plugin\deinterlace\afsvf\en"; Description: English UI; Flags: exclusive; Types: full full32 xp
Name: "plugin\deinterlace\afsvf\jp"; Description: Japanese UI; Flags: exclusive; Types: fulljp full32jp xpjp
;------------------------------------
; Denoisers
;------------------------------------
Name: "plugin\denoise"; Description: Denoisers
;NL-Means for GPU Type-C
Name: "plugin\denoise\nlgpuc"; Description: NL-Means for GPU Type-C
Name: "plugin\denoise\nlgpuc\en"; Description: English UI; Flags: exclusive; Types: full full32 xp
Name: "plugin\denoise\nlgpuc\jp"; Description: Japanese UI; Flags: exclusive; Types: fulljp full32jp xpjp
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
Name: "plugin\edit\logo"; Description: Logo Analysis and Removal
Name: "plugin\edit\logo\en"; Description: English UI; Types: full full32 xp
Name: "plugin\edit\logo\jp"; Description: Japanese UI; Types: fulljp full32jp xpjp
;Resize filter
Name: "plugin\edit\resize"; Description: Resize filter (SSE2 and AVX support)
Name: "plugin\edit\resize\en"; Description: English UI; Types: full full32 xp
Name: "plugin\edit\resize\jp"; Description: Japanese UI; Types: fulljp full32jp xpjp
;Liquid Rescale
Name: "plugin\edit\lqr"; Description: Liquid Rescale (Content-aware rescale)
Name: "plugin\edit\lqr\en"; Description: English UI; Types: full full32 fulljp full32jp
;IppRepair:: Image inpainting and repair
Name: "plugin\edit\ipprepair"; Description: IppRepair (Inpainting/Repair)
Name: "plugin\edit\ipprepair\en"; Description: English UI; Types: full full32 fulljp full32jp
;ImasUncaption:: Image inpainting and repair
Name: "plugin\edit\imasuncaption"; Description: ImasUncaption (Inpainting/Repair)
Name: "plugin\edit\ipprepair\en"; Description: English UI; Types: full full32 xp
Name: "plugin\edit\ipprepair\jp"; Description: Japanese UI; Types: fulljp full32jp xpjp
;PS Level
Name: "plugin\edit\pslevel"; Description: Photoshop-like Color Leveling
Name: "plugin\edit\pslevel\en"; Description: English UI; Types: full full32 fulljp full32jp
;Sigmoidal contrast and brightness
Name: "plugin\edit\sigcolor"; Description: Sigmoidal Contrast and Brigntness
Name: "plugin\edit\sigcolor\en"; Description: English UI; Types: full full32 fulljp full32jp

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
Name: "plugin\misc\mtmk1"; Description: Motion Tracking MK-I(OpenCV2); Types: full full32 fulljp full32jp
;Motion Tracking MK-II
Name: "plugin\misc\mtmk2"; Description: Motion Tracking MK-II(OpenCV3);

;=====================================
; Scripts
;=====================================
; Script language should be chosen upon on NLE's language automatically
Name: "script"; Description: Effect Scripts and Custom Objects
Name: "script\satsuki"; Description: Scripts by Satsuki; Types: full full32 xp fulljp full32jp xpjp
Name: "script\tim"; Description: Scripts by Tim; Types: full full32 xp fulljp full32jp xpjp
Name: "script\rikki"; Description: Scripts by Rikki; Types: full full32 xp fulljp full32jp xpjp
Name: "script\hksy"; Description: Scripts by hksy; Types: full full32 xp fulljp full32jp xpjp
Name: "script\mt"; Description: Scripts by MaverickTse; Types: full full32 xp fulljp full32jp xpjp
Name: "script\mt\svg"; Description: SVG Custom Object; Types: full full32 xp fulljp full32jp xpjp
Name: "script\others"; Description: Scripts by various authors; Types: full full32 xp fulljp full32jp xpjp

;=====================================
; 3rd-Party Tools
;=====================================
Name: "party"; Description: "Third-Party Tools"
Name: "party\ls"; Description: L-Smash (required by x26XGuiEx); Types: full full32 xp fulljp full32jp xpjp
Name: "party\ffmpeg"; Description: FFmpeg (required by ffmpegOut); Types: full full32 xp fulljp full32jp xpjp
Name: "party\x264"; Description: x264 AVC video encoder; Types: full full32 xp fulljp full32jp xpjp
Name: "party\x265"; Description: x265 HEVC video encoder; Types: full full32 xp fulljp full32jp xpjp
Name: "party\qaac"; Description: AAC Audio Encoder (requires iTune); Types: full full32 xp fulljp full32jp xpjp
Name: "party\neroaac"; Description: AAC Audio Encoder (Nero); Types: full full32 xp fulljp full32jp xpjp
Name: "party\opus"; Description: Opus audio encoder; Types: full full32 xp fulljp full32jp xpjp
Name: "party\ogg"; Description: Ogg audio encoder; Types: full full32 xp fulljp full32jp xpjp
Name: "party\flac"; Description: FLAC audio encoder; Types: full full32 xp fulljp full32jp xpjp
Name: "party\mkvmerge"; Description: MKVMerge (required to export MKV); Types: full full32 xp fulljp full32jp xpjp

;=====================================
; Utilities
;=====================================
Name: "util"; Description: Small Utilities
Name: "util\exo2sub"; Description: Convert EXO to SRT/ASS subtitle; Types: full full32 xp fulljp full32jp xpjp
Name: "util\exostacker"; Description: Merge several EXOs in a top-down manner; Types: full full32 xp fulljp full32jp xpjp
Name: "util\exofps"; Description: Change EXO framerate; Types: full full32 xp fulljp full32jp xpjp
Name: "util\exofps\jp"; Description: Japanese UI; Types: full full32 xp fulljp full32jp xpjp
