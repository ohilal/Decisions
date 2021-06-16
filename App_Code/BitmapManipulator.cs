using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.IO;

/// <summary>
/// Summary description for BitmapManipulator
/// </summary>
public class BitmapManipulator
{
    public BitmapManipulator()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    /// <summary>Converts a bitmap to another bitmap format, returning the new converted
    ///     bitmap
    /// </summary>
    /// 
    /// <param name="inputBmp">Bitmap to convert</param>
    /// <param name="destFormat">Bitmap format to convert to</param>
    /// 
    /// <returns>A new bitmap object containing the input bitmap converted.
    ///     If the destination format and the target format are the same, returns
    ///     a clone of the destination bitmap.</returns>
    public static Bitmap ConvertBitmap(Bitmap inputBmp,
        System.Drawing.Imaging.ImageFormat destFormat)
    {
        //If the dest format matches the source format and quality/bpp not changing, just clone
        if (inputBmp.RawFormat.Equals(destFormat))
        {
            return (Bitmap)inputBmp.Clone();
        }

        //Create an in-memory stream which will be used to save
        //the converted image
        System.IO.Stream imgStream = new System.IO.MemoryStream();

        //Save the bitmap out to the memory stream, using the format indicated by the caller
        inputBmp.Save(imgStream, destFormat);

        //At this point, imgStream contains the binary form of the
        //bitmap in the target format.  All that remains is to load it
        //into a new bitmap object
        Bitmap destBitmap = new Bitmap(imgStream);

        //Free the stream
        //imgStream.Close();
        //For some reason, the above causes unhandled GDI+ exceptions
        //when destBitmap.Save is called.  Perhaps the bitmap object reads
        //from the stream asynchronously?

        return destBitmap;
    }

    /// <summary>
    /// Resizes a bitmap's width and height independently
    /// </summary>
    /// <param name="inputBmp">Bitmap to resize</param>
    /// <param name="imgWidth">New width</param>
    /// <param name="imgHeight">New height</param>
    /// <returns>Resized bitmap</returns>
    public static Bitmap ResizeBitmap(Bitmap inputBmp, int imgWidth, int imgHeight)
    {
        //Simply compute scale factors that result in the desired size, then call ScaleBitmap
        return ScaleBitmap(inputBmp,
                           (float)imgWidth / (float)inputBmp.Size.Width,
                           (float)imgHeight / (float)inputBmp.Size.Height);
    }

    /// <summary>
    /// Scales a bitmap by a scale factor, growing or shrinking both axes independently, 
    /// possibly changing the aspect ration
    /// </summary>
    /// <param name="inputBmp">Bitmap to scale</param>
    /// <param name="scaleFactor">Factor by which to scale</param>
    /// <returns>New bitmap containing image from inputBmp, scaled by the scale factor</returns>
    public static Bitmap ScaleBitmap(Bitmap inputBmp, double xScaleFactor, double yScaleFactor)
    {
        //Create a new bitmap object based on the input
        Bitmap newBmp = new Bitmap(
                                  (int)(inputBmp.Size.Width * xScaleFactor),
                                  (int)(inputBmp.Size.Height * yScaleFactor),
                                  PixelFormat.Format24bppRgb);//Graphics.FromImage doesn't like Indexed pixel format

        //Create a graphics object attached to the new bitmap
        Graphics newBmpGraphics = Graphics.FromImage(newBmp);

        //Set the interpolation mode to high quality bicubic 
        //interpolation, to maximize the quality of the scaled image
        newBmpGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;

        newBmpGraphics.ScaleTransform((float)xScaleFactor, (float)yScaleFactor);

        //Draw the bitmap in the graphics object, which will apply
        //the scale transform
        //Note that pixel units must be specified to ensure the framework doesn't attempt
        //to compensate for varying horizontal resolutions in images by resizing; in this case,
        //that's the opposite of what we want.
        Rectangle drawRect = new Rectangle(0, 0, inputBmp.Size.Width, inputBmp.Size.Height);
        newBmpGraphics.DrawImage(inputBmp, drawRect, drawRect, GraphicsUnit.Pixel);

        //Return the bitmap, as the operations on the graphics object
        //are applied to the bitmap
        newBmpGraphics.Dispose();

        //newBmp will have a RawFormat of MemoryBmp because it was created
        //from scratch instead of being based on inputBmp.  Since it it inconvenient
        //for the returned version of a bitmap to be of a different format, now convert
        //the scaled bitmap to the format of the source bitmap
        return ConvertBitmap(newBmp, inputBmp.RawFormat);
    }
}
