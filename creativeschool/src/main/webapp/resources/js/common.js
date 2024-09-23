const addressKey='devU01TX0FVVEgyMDI0MDkyMzIzNTAzMTExNTEwMzQ=';
const addressKeyEncode='devU01TX0FVVEgyMDI0MDkyMzIzNTAzMTExNTEwMzQ%3D';

function openSearchAddress(inputElement){
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	            console.log(data);
	            console.log(inputElement);
	            inputElement.value=`${data.address}`;
	        }
	    }).open();
}