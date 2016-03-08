package springmvc.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class TestingController {

	
	@Autowired
	//private static ServletContext context;
	private static ServletContext context;

	public void setServletContext(ServletContext servletContext) {
	     this.context = servletContext;
	}
	private static File getFileDirectory()
	{
		
		//System.out.println(context.getContext("/WEB-INF/"));
		String path = context.getRealPath("/WEB-INF/files");
		//String path = context.getRealPath("/WEB-INF/files");
		//System.out.println(path);
		return new File (path);
		
		/*if(context.getRealPath("WEB-INF/files") != null)
		{
			String path = context.getRealPath("/WEB-INF/jsp");
			//String path = context.getRealPath("/WEB-INF/files");
			System.out.println(path);
			//return new File (path);
		}
		
		else
			System.out.println("notable to execute");*/
			
	}
	
	@RequestMapping(value = "/admin/test.html")
	public static String testing()
	{
		return "/admin/test";
	}
	
	@RequestMapping(value = "/admin/upload.html",method = RequestMethod.POST)
	public static String upLoadFile(@RequestParam MultipartFile file)
	{
		try {
			getFileDirectory();
			
			//file.transferTo(new File ( getFileDirectory(), file.getOriginalFilename()));
			
			System.out.println("file uploaded"+file.getName());
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping("/admin/download.html")
	public static String downloadFile(HttpServletResponse response) throws IOException
	{
		response.setContentType( "text/plain" );
        response.setHeader( "Content-Disposition",
            "inline; filename=insert.txt" );
		
		FileInputStream in = new FileInputStream(new File(getFileDirectory(),"insert.txt"));
		OutputStream out = response.getOutputStream();
		byte buffer[] = new byte[2048];
		int bytesRead;
		while ((bytesRead = in.read(buffer)) > 0)
		{
			out.write(buffer, 0, bytesRead);
		}
		in.close();
		return null;
		
	}

}

