package com.km.common;

public class PageFactory {
	
	public static String getPage(long cPage, long numPerpage, long totalData,
			String url) {
		
		StringBuffer pageBar=new StringBuffer();
		
		long totalPage=(long)(Math.ceil((double)totalData/numPerpage));
		int pageBarSize=5;
		long pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		long pageEnd=pageNo+pageBarSize-1;
		
		pageBar.append("<ul class='pagination justify-content-center pagination-sm'>");
		
		if(pageNo==1) {
			pageBar.append("<li class='page-item disabled'>");
			pageBar.append("<a class='page-link' href='#'>이전</a>");
			pageBar.append("</li>");
		}else {
			pageBar.append("<li class='page-item'>");
			pageBar.append("<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>");
			pageBar.append("</li>");
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(cPage==pageNo) {
				pageBar.append("<li class='page-item disabled'>");
				pageBar.append("<a class='page-link' href='#'>"+pageNo+"</a>");
				pageBar.append("</li>");
			}else {
				pageBar.append("<li class='page-item'>");
				pageBar.append("<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>");
				pageBar.append("</li>");
			}
			pageNo++;
			
		}
		
		if(pageNo>totalPage) {
			pageBar.append("<li class='page-item disabled'>");
			pageBar.append("<a class='page-link' href='#'>다음</a>");
			pageBar.append("</li>");
		}else {
			pageBar.append("<li class='page-item'>");
			pageBar.append("<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>다음</a>");
			pageBar.append("</li>");
		}
		
		pageBar.append("<script>");
		pageBar.append("function fn_paging(pageNo){");
		pageBar.append("location.assign('"+url+"?cPage='+pageNo+'&numPerpage="+numPerpage+"');");
		pageBar.append("}");
		pageBar.append("</script>");
		
		
		
		return new String(pageBar);
	}
}
