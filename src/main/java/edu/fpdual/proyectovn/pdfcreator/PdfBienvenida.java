package edu.fpdual.proyectovn.pdfcreator;

import com.itextpdf.text.BadElementException;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.stream.Stream;

public class PdfBienvenida {
  /*public void createPDF(String filename, String text) throws IOException, DocumentException, URISyntaxException {
    Path path = Paths.get(ClassLoader.getSystemResource("static/images/icons/logoVN.jpg").toURI());
    Document document = new Document();
    PdfWriter.getInstance(document, new FileOutputStream(fileName + ".pdf"));

    document.open();
    Paragraph paragraph = createParagraph(text);
    Image image = createImage(path, scale : 50);
  }
    private Image createImage(Path path, float scale) throw BadElementException, IOException {
      Image image = Image.getInstance(path.toAbsolutePath().toString());
      image.scalePercent(scale);
      return image;
    }

    private Paragraph createParagraph(String text) {
    Font font = FontFactory.getFont(FontFactory.COURIER, 16, BaseColor.BLACK);
    Paragraph paragraph = new Paragraph(text, font);
    paragraph.setSpacingAfter(10f);
    return paragraph;
  }

  public static void main(String[] args) throws DocumentException, IOException, URISyntaxException {
    new PdfBienvenida().createPDF("PdfBienvenida", "Probando mensajes bienvenida a la app");
  }*/
}
