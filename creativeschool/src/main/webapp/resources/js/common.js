const addressKey='devU01TX0FVVEgyMDI0MDkyMzIzNTAzMTExNTEwMzQ=';
const addressKeyEncode='devU01TX0FVVEgyMDI0MDkyMzIzNTAzMTExNTEwMzQ%3D';
//주소검색 api이용
function openSearchAddress(inputElement){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            inputElement.value=`${data.address}`;
	        }
	    }).open();
}
//경찰서 검색 공공데이터 이용
function searchPoliceStation(){
	fetch('https://api.odcloud.kr/api/15077036/v1/uddi:9f06486e-514f-45c9-a531-f15d74dba23e?page=1&perPage=2051&serviceKey=H1hTYjvwBEqrzWZsXvTi6T8cHV%2FEZ5D3Z7Tr5%2B0AJNeEr4qWZWQ1RB%2FT%2FgIpK0%2FP%2Bw%2BpkoVbJY5oYk%2BpgesyFQ%3D%3D' )
	 .then(response=>response.json())
	 .then(data=>{
	     console.log(data);
	 });
}
