# Firefox OS Screencaster

This bash scripts allows to record a FirefoxOS video.

## FAQ
### Why do you do this stuff?

Because I needed to record some videos for Bug tracking and I was tired to use the opaque proyector ;) I wanted an easier way to record simple videos.

### You are using ADB. Does this mean this works on android phones?

Theorically yes, if the handsets uses the /dev/graphics/fb0 this should work. But I didn't tested yet 

### How it works?

The idea is really simple, get as many frames as we can recovering it from the framebuffer file (/dev/graphics/fb0)

The following command gets framebuffer screenshots and are recorded in the CWD of your workstation.
Also, this command generates a "frames.txt" file with a list of all generated frames
To stop recording, press Ctrl+C

```bash
./record.sh
```

After that, we convert all the frames to PNG format with the following command:

```bash
./convertframes.sh
```

Then we need to generate a video file. To do this, we should call the command:

```bash
./generatevideo.sh <frames_per_second> <output_filename>
```

Example:

```bash
./generatevideo.sh 1 video
```

Finally we can clean all temporal files:

```bash
./clean.sh
```

## Ideas to improve

I'm working on improve the method:

 * Improve the color pallete of each frame
 * Improve speed. With my current laptop I can get near 1 sec. between frames. I'll test with RAM disk or SSD to improve speed. Another idea is to store in the phone's SDCard to avoid ADB latency.
 * Change to only one script to simplify the use of it.
 * Generate DEBIAN package ;)
 * Automatic screen size detection

## Tricks

Since the video is generated using mencoder from all the frames, we can cut the video in an easy way only removing the frames references from the frames.txt before video generation.

If you need to blur some parts of the video (to hide passwd or private data) you can use Imagemagick on the affected frames before video generation.

You can accelerate the video increasing the frames_per_second parameter on teh generate video script to a higher value of the capture rate.

If you're using a different screen size handset, you should change the resolution in the convertframes.sh script.

