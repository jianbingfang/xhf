package com.xthena.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
 
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
 
import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.converter.ExcelToHtmlConverter;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.converter.PicturesManager;
import org.apache.poi.hwpf.converter.WordToHtmlConverter;
import org.apache.poi.hwpf.usermodel.Picture;
import org.apache.poi.hwpf.usermodel.PictureType;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xwpf.converter.core.FileImageExtractor;
import org.apache.poi.xwpf.converter.core.FileURIResolver;
import org.apache.poi.xwpf.converter.xhtml.XHTMLConverter;
import org.apache.poi.xwpf.converter.xhtml.XHTMLOptions;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.w3c.dom.Document;
 
public class PoiToHtmlUtil {
	 
	public static final String path = ConfUtil.getProperty("upload.dir");
    // final String file = "123.doc";
     
	
	public static String wordToHtml(String fileurl) throws Exception{
		String fileName=fileurl.substring(fileurl.lastIndexOf("/"), fileurl.length());
		System.out.println(path + fileName);
		InputStream input = new FileInputStream (path + fileName);
		Document htmlDocument =null;
		ByteArrayOutputStream outStream = new ByteArrayOutputStream();
		 
		if(fileName.endsWith("xls")||fileName.endsWith("xlsx")){
			if(fileName.endsWith("xls")){
			 HSSFWorkbook excelBook=new HSSFWorkbook(input);
			 ExcelToHtmlConverter excelToHtmlConverter = new ExcelToHtmlConverter (DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument() );
			 excelToHtmlConverter.processWorkbook(excelBook);
			 List pics = excelBook.getAllPictures();
		     if (pics != null) {
		         for (int i = 0; i < pics.size(); i++) {
		             Picture pic = (Picture) pics.get (i);
		             try {
		                 pic.writeImageContent (new FileOutputStream (path + pic.suggestFullFileName()));
		             } catch (FileNotFoundException e) {
		                 e.printStackTrace();
		             }
		         }
		     }
		     htmlDocument =excelToHtmlConverter.getDocument();
		     DOMSource domSource = new DOMSource (htmlDocument);
		        
		      StreamResult streamResult = new StreamResult (outStream);
		 
		        TransformerFactory tf = TransformerFactory.newInstance();
		        Transformer serializer = tf.newTransformer();
		        serializer.setOutputProperty (OutputKeys.ENCODING, "UTF-8");
		        serializer.setOutputProperty (OutputKeys.INDENT, "yes");
		        serializer.setOutputProperty (OutputKeys.METHOD, "html");
		        serializer.transform (domSource, streamResult);
		        outStream.close();
			}else{
				XSSFWorkbook wordDocument = new XSSFWorkbook (input);

				// 3) Convert XWPFDocument to XHTML
				File imageFolderFile = new File("path"+"/media/");
				if(!imageFolderFile.exists()){
					imageFolderFile.mkdirs();
				}
				XHTMLOptions options = XHTMLOptions.create().URIResolver(
						new FileURIResolver(imageFolderFile));
				options.setExtractor(new FileImageExtractor(imageFolderFile));
			 
			//XHTMLConverter.getInstance().convert(wordDocumen, outStream, options);
			}
		}else if(fileName.endsWith("doc")||fileName.endsWith("docx")){
			 List pics =null;
			 if(fileName.endsWith("doc")){
				  WordToHtmlConverter wordToHtmlConverter = new WordToHtmlConverter (DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument() );
			        wordToHtmlConverter.setPicturesManager (new PicturesManager() {
			            public String savePicture (byte[] content, PictureType pictureType, String suggestedName, float widthInches, float heightInches) {
			                return suggestedName;
			            }
			        });
			        
				  HWPFDocument wordDocument = new HWPFDocument (input);
				  wordToHtmlConverter.processDocument (wordDocument);
				  pics= wordDocument.getPicturesTable().getAllPictures();
				  
				  if (pics != null) {
			            for (int i = 0; i < pics.size(); i++) {
			                Picture pic = (Picture) pics.get (i);
			                try {
			                    pic.writeImageContent (new FileOutputStream (path + pic.suggestFullFileName() ) );
			                } catch (FileNotFoundException e) {
			                    e.printStackTrace();
			                }
			            }
			        }
			      
				  
				  htmlDocument = wordToHtmlConverter.getDocument();
				  
			      DOMSource domSource = new DOMSource (htmlDocument);
			        
			      StreamResult streamResult = new StreamResult (outStream);
			 
			        TransformerFactory tf = TransformerFactory.newInstance();
			        Transformer serializer = tf.newTransformer();
			        serializer.setOutputProperty (OutputKeys.ENCODING, "UTF-8");
			        serializer.setOutputProperty (OutputKeys.INDENT, "yes");
			        serializer.setOutputProperty (OutputKeys.METHOD, "html");
			        serializer.transform (domSource, streamResult);
			        outStream.close();
			}else{
				XWPFDocument wordDocument = new XWPFDocument (input);

				// 3) Convert XWPFDocument to XHTML
				File imageFolderFile = new File("path"+"/media/");
				if(!imageFolderFile.exists()){
					imageFolderFile.mkdirs();
				}
				XHTMLOptions options = XHTMLOptions.create().URIResolver(
						new FileURIResolver(imageFolderFile));
				options.setExtractor(new FileImageExtractor(imageFolderFile));
			 
				XHTMLConverter.getInstance().convert(wordDocument, outStream, options);
				//wordToHtmlConverter.processDocument (wordDocument);
				//pics= wordDocument.getPicturesTable().getAllPictures();
			}
		}
	   String content = new String (outStream.toByteArray() );
        return content;
	        
	}
    public static void main (String[] args) throws Throwable {
    	System.out.println(wordToHtml("http://localhost:8080/xhf/s/upload/1419237037073.docx"));
    }
}
