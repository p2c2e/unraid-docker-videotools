!/bin/sh

# Check if ffmpeg is installed
if ! command -v ffmpeg &> /dev/null; then
    echo "Error: ffmpeg is not installed. Please install it before running this script."
    exit 1
fi

# Set the input directory containing the VIDEO_TS files
input_directory="VIDEO_TS"

# Set the output MKV file name
output_file="output.mkv"

# Combine all VOB files into a single MKV file
FILE_LIST=$(find "$input_directory" -type f -name "*.VOB" -exec printf "%s|" {} + | sed 's/|$//')
echo $FILE_LIST
ffmpeg -fflags +genpts -i "concat:${FILE_LIST}"  -c:v copy -c:a copy "$output_file"
# ffmpeg -i "concat:VTS_01_1.VOB|VTS_01_2.VOB" -vcodec libx265 new-video-h265.mkv
# ffmpeg -i "$input_directory"/VTS_*.VOB -c copy "$output_file"

echo "Conversion completed. The MKV file is saved as $output_file."
