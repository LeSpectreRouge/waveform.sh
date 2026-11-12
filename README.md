### waveform.sh

Generate an audio waveform video from a static image and an audio file using FFmpeg.

"waveform.sh" creates an MP4 video with a white animated audio waveform overlaid on your image, synchronized with the original audio.

Features

- Generate audio waveform videos using FFmpeg.
- Supports Linux and Android (Termux).
- Accepts image and audio files as command-line arguments.
- Supports filenames containing spaces.
- Automatically detects whether FFmpeg is installed.
- H.264 video encoding (MP4).
- AAC audio encoding (320 kbps).
- 1920×300 waveform at 30 FPS.
- High-quality video output.

Requirements

- Bash
- FFmpeg with "libx264" and AAC encoding support.

Linux

Debian / Ubuntu:

sudo apt update<br>
sudo apt install ffmpeg

Android (Termux)

pkg update<br>
pkg install ffmpeg

To access shared Android storage:

termux-setup-storage

Installation

Clone the repository:

git clone https://github.com/LeSpectreRouge/waveform.sh.git<br>
cd waveform.sh

Make the script executable:

chmod +x waveform.sh

Usage

./waveform.sh <image> <audio> <output.mp4>

Example

./waveform.sh image.jpg music.opus output.mp4

With filenames containing spaces:

./waveform.sh "My Cover.jpg" "My Music.opus" "My Video.mp4"

Output

The generated video contains:

- The input image as the background.
- A centered white audio waveform near the bottom.
- The original audio encoded in AAC.
- H.264 video encoded using the medium preset and CRF 18.

Compatibility

Platform| Supported
Linux| Yes
Android (Termux)| Yes
macOS| Not tested

License

MIT License.
