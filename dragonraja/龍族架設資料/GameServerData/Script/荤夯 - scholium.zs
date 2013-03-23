@sys00	; 처음 서버 Setting하는 함수.

	MaxNPC( 50 )
	
	MapName( "SCHOLIUM" )
	
end	


@sys01 
end
@sys02 
end
@sys03 
end
@sys04 
end
@sys05 
end
@sys06 
end
@sys07 
end
@sys08 
end
@sys09 
end




@Npc00000	
;그냥 돌아 다니는 NPC 50번 퀘스트에서 0번 부터 사용한다.
	CmpQuestNumStep(50,17)
	if( yes == 2 )
	{
	D("제가 도움을 드려도 될까요?")
	SetQuestNumStep(50,0)
	goto END00_
	}
	CmpQuestNumStep(50,0)
	if( yes == 1 )
	{
	D("이곳은 스콜리움<Scholium>입니다. ")
	SetQuestNumStep(50,1)
	goto END00_
	}
	CmpQuestNumStep(50,1)
	if( yes == 1 )
	{
	D("스콜리움은 초보자들만 이용할 수 있는 공간입니다. ")
	SetQuestNumStep(50,2)
	goto END00_
	}
	CmpQuestNumStep(50,2)
	if( yes == 1 )
	{
	D("마우스로 돌아다니는 주민들을 누르면 대화를 나눌 수 있습니다.")
	SetQuestNumStep(50,3)
	goto END00_
	}
	CmpQuestNumStep(50,3)
	if( yes == 1 )
	{
	D("왼쪽 위에 보면, TIP보기도 있으니, 클릭해보세요.")
	SetQuestNumStep(50,4)
	goto END00_
	}
	CmpQuestNumStep(50,4)
	if( yes == 1 )
	{
	D("죽었을 때에는 다음과 같이 주문을 외우세요.")
	SetQuestNumStep(50,5)
	goto END00_
	}
	CmpQuestNumStep(50,5)
	if( yes == 1 )
	{
	D("코스모스와 대폭풍의 에델브로이 이름으로")
	SetQuestNumStep(50,6)
	goto END00_
	}
	CmpQuestNumStep(50,6)
	if( yes == 1 )
	{
	D("이 주문을 치면 죽어서 유령이 되었어도 살아날 수 있습니다.")
	SetQuestNumStep(50,7)
	goto END00_
	}
	CmpQuestNumStep(50,7)
	if( yes == 1 )
	{
	D("마을에서는 신전에 가서 주문을 외우셔야 됩니다..")
	SetQuestNumStep(50,8)
	goto END00_
	}
	CmpQuestNumStep(50,8)
	if( yes == 1 )
	{
	D("PEACE 모드 와 BATTLE 모드의 전환은 화면 우측 하단의 버튼을 누르면 가능하죠.")
	SetQuestNumStep(50,9)
	goto END00_
	}
	CmpQuestNumStep(50,9)
	if( yes == 1 )
	{
	D("울타리 안의 사람들을 클릭하면, NPC와 대화를 할 수 있고 아이템도 살 수 있다네.")
	SetQuestNumStep(50,10)
	goto END00_
	}
	CmpQuestNumStep(50,10)
	if( yes == 1 )
	{
	D("MAP버튼 옆의 'PEACE'버튼을 누르면 'BATTLE'모드로 전환합니다.")
	SetQuestNumStep(50,11)
	goto END00_
	}
	CmpQuestNumStep(50,11)
	if( yes == 1 )
	{
	D("아래쪽으로 향한 길을 따라 내려가면, 마을로 갈 수 있습니다.")
	SetQuestNumStep(50,12)
	goto END00_
	}
	CmpQuestNumStep(50,12)
	if( yes == 1 )
	{
	D("길가에 세워진 이정표에 마우스를 갖다대면, 방향을 알 수 있습니다.")
	SetQuestNumStep(50,13)
	goto END00_
	}
	CmpQuestNumStep(50,13)
	if( yes == 1 )
	{
	D("여기 말고 다른 마을에서는 오른쪽 아래의 Map 버튼을 누르면 지도가 나온다네.")
	SetQuestNumStep(50,14)
	goto END00_
	}
	CmpQuestNumStep(50,14)
	if( yes == 1 )
	{
	D("지도에서 하얀 점이 깜빡이고 있지. 그곳이 지금 자네의 위치라네.")
	SetQuestNumStep(50,15)
	goto END00_
	}
	CmpQuestNumStep(50,15)
	if( yes == 1 )
	{
	D("지도의 건물들 위에 마우스를 올려 놓으면 그 건물의 이름이 나타나지.")
	SetQuestNumStep(50,16)
	goto END00_
	}
	CmpQuestNumStep(50,16)
	if( yes == 1 )
	{
	D("MAP버튼을 누르면 열렸던 지도가 닫혀지지. 열땐 다시 그 버튼을 누르면 된다네.")
	SetQuestNumStep(50,17)
	goto END00_
	}
	CmpQuestNumStep(50,17)
	if( yes == 1 )
	{
	D("건물들 옆에 있는 현판 위에 마우스를 올리면 그 건물의 이름이 나오지.")
	SetQuestNumStep(50,18)
	goto END00_
	}
:END00_
end
@Npc00001
;회관 주인 50번 퀘스트에서 20번 부터 사용한다.
	;앞에.. 유의 할점 시작 번호보다 낮은 값은 시작 값으로 맞춰주거,
	; 끝 번호 보다 높은 값은 시작 값으로 맞춰준다.
	CmpQuestNumStep(50,20)
	if( yes == 0 )
	{
	D("나는 여관에서 일하지")
	SetQuestNumStep(50,20)
	goto END01_
	}
	CmpQuestNumStep(50,31)
	if( yes == 2 )
	{
	D("나는 여관에서 일하지")
	SetQuestNumStep(50,20)
	goto END01_
	}
	CmpQuestNumStep(50,20)
	if( yes == 1 )
	{
	D("자네가 처음 시작해서 아직 직업 기술이 없거나")
	SetQuestNumStep(50,21)
	goto END01_
	}
	CmpQuestNumStep(50,21)
	if( yes == 1 )
	{
	D("무기가 없다면 마을회관으로 찾아가 보게")
	SetQuestNumStep(50,22)
	goto END01_
	}
	CmpQuestNumStep(50,22)
	if( yes == 1 )
	{
	D("그럼 이제 지도를 보는 방법을 알려주지")
	SetQuestNumStep(50,23)
	goto END01_
	}
	CmpQuestNumStep(50,23)
	if( yes == 1 )
	{
	D("우선 좌표를 알아야돼")
	SetQuestNumStep(50,24)
	goto END01_
	}
	CmpQuestNumStep(50,24)
	if( yes == 1 )
	{
	D("현재 좌표는 오른쪽에 보면 나와 있을 텐데")
	SetQuestNumStep(50,25)
	goto END01_
	}
	CmpQuestNumStep(50,25)
	if( yes == 1 )
	{
	D("아마 (xxx,yyy)형태로 되어 있는 숫자로 나와 있을 거야")
	SetQuestNumStep(50,26)
	goto END01_
	}
	CmpQuestNumStep(50,26)
	if( yes == 1 )
	{
	D("xxx는 오른쪽으로 갈수록 커지는 값이고")
	SetQuestNumStep(50,27)
	goto END01_
	}
	CmpQuestNumStep(50,27)
	if( yes == 1 )
	{
	D("yyy는 왼쪽으로 갈수록 커지는 값이지")
	SetQuestNumStep(50,28)
	goto END01_
	}
	CmpQuestNumStep(50,28)
	if( yes == 1 )
	{
	D("이 좌표를 잘 이용하면, 마을 어떤 곳이든 좌표만 있으면 찾아다닐 수 있지")
	SetQuestNumStep(50,29)
	goto END01_
	}
	CmpQuestNumStep(50,29)
	if( yes == 1 )
	{
	D("한가지 유의할 점은 그곳에 나오는 좌표는 마우스가 가리키는 곳의 좌표라는 점일세.")
	SetQuestNumStep(50,30)
	goto END01_
	}
	CmpQuestNumStep(50,30)
	if( yes == 1 )
	{
	D("그럼 다른 마을 주민들로 부터 이야기를 들어 보게나.")
	SetQuestNumStep(50,31)
	goto END01_
	}
:END01_
	CallSmallMenu( 0, 67 ) ; 여관 인터페이스
end
@Npc00002	
;농장 주인장. 50번 퀘스트 50번 부터 사용한다.
	;앞에.. 유의 할점 시작 번호보다 낮은 값은 시작 값으로 맞춰주거,
	; 끝 번호 보다 높은 값은 시작 값으로 맞춰준다.
	CmpQuestNumStep(50,50)
	if( yes == 0 )
	{
	D("흐흐 나는 농장 주인이야")
	SetQuestNumStep(50,50)
	goto END02_
	}
	CmpQuestNumStep(50,60)
	if( yes == 2 )
	{
	D("나는야 농장 주인~!")
	SetQuestNumStep(50,50)
	goto END02_
	}
	CmpQuestNumStep(50,50)
	if( yes == 1 )
	{
	D("나는 농장을 경영하고 있어, 농장에서는 각종 곡식과 채소를 팔고 있지")
	SetQuestNumStep(50,51)
	goto END02_
	}
	CmpQuestNumStep(50,51)
	if( yes == 1 )
	{
	D("그냥 먹어도 되고, 요리를 해서 먹어도 돼")
	SetQuestNumStep(50,52)
	goto END02_
	}
	CmpQuestNumStep(50,52)
	if( yes == 1 )
	{
	D("나는 농장을 경영하고 있어, 농장에서는 각종 곡식과 채소를 팔고 있지")
	SetQuestNumStep(50,53)
	goto END02_
	}
	CmpQuestNumStep(50,53)
	if( yes == 1 )
	{
	D("우리집은 농약은 취급하지 않고 있어. 행여라도 농약 칠 생각은 하지 말게.")
	SetQuestNumStep(50,54)
	goto END02_
	}
	CmpQuestNumStep(50,54)
	if( yes == 1 )
	{
	D("농장에서는 농부들에게만 농사길술을 가르치고 있어.")
	SetQuestNumStep(50,55)
	goto END02_
	}
	CmpQuestNumStep(50,55)
	if( yes == 1 )
	{
	D("삽으로 땅파서 개간하기, 씨뿌리기, 낫으로 수확하기를 가르치고 있는데.")
	SetQuestNumStep(50,56)
	goto END02_
	}
	CmpQuestNumStep(50,56)
	if( yes == 1 )
	{
	D("목동한테는 양털 깎기 기술을 함께 가르치고 있다네.")
	SetQuestNumStep(50,57)
	goto END02_
	}
	CmpQuestNumStep(50,57)
	if( yes == 1 )
	{
	D("하지만, 거짓말은 가르치지 않고 있네, 앗 제게 뭐야?")
	SetQuestNumStep(50,58)
	goto END02_
	}
	CmpQuestNumStep(50,58)
	if( yes == 1 )
	{
	D("늑대가 나타났다~~!")
	SetQuestNumStep(50,59)
	goto END02_
	}
	CmpQuestNumStep(50,59)
	if( yes == 1 )
	{
	D("뻥이야~~~")
	SetQuestNumStep(50,61)
	goto END02_
	}
	CmpQuestNumStep(50,61)
	if( yes == 1 )
	{
	D("흠흠 양털 깎는데 필요한 가위도 팔고 있는데. 하나 사실라우?")
	SetQuestNumStep(50,62)
	goto END02_
	}
:END02_	
	CallSmallMenu( 0, 19 )
end
@Npc00003	
;빵집주인 50번 퀘스트 70번 부터 사용한다.
;
	;앞에.. 유의 할점 시작 번호보다 낮은 값은 시작 값으로 맞춰주거,
	; 끝 번호 보다 높은 값은 시작 값으로 맞춰준다.
	CmpQuestNumStep(50,70)
	if( yes == 0 )
	{
	D("나는 조그맣게 베이커리 사업을 하지.")
	SetQuestNumStep(50,70)
	goto END03_
	}
	CmpQuestNumStep(50,81)
	if( yes == 2 )
	{
	D("나는 조그맣게 베이커리 사업을 하지.")
	SetQuestNumStep(50,70)
	goto END03_
	}
	CmpQuestNumStep(50,70)
	if( yes == 1 )
	{
	D("나는 빵집을 하고 있어. 그런데 빵만 파는건 아니야.")
	SetQuestNumStep(50,71)
	goto END03_
	}
	CmpQuestNumStep(50,71)
	if( yes == 1 )
	{
	D("빵 뿐만 아니라, 여러 가지의 음식을 판매하고 있어.")
	SetQuestNumStep(50,72)
	goto END03_
	}
	CmpQuestNumStep(50,72)
	if( yes == 1 )
	{
	D("곡류, 야채, 고기, 밥, 케잌 등을 팔고 있으니")
	SetQuestNumStep(50,73)
	goto END03_
	}
	CmpQuestNumStep(50,73)
	if( yes == 1 )
	{
	D("골라 먹는 재미가 쏠쏠하지~")
	SetQuestNumStep(50,74)
	goto END03_
	}
	CmpQuestNumStep(50,74)
	if( yes == 1 )
	{
	D("배고플 때에, 내 요리를 먹으면 금방 허기가 가라않지..")
	SetQuestNumStep(50,75)
	goto END03_
	}
	CmpQuestNumStep(50,75)
	if( yes == 1 )
	{
	D( "우리 빵집은 자체적으로 요리사를 길러내고 있어.")
	SetQuestNumStep(50,76)
	goto END03_
	}
	CmpQuestNumStep(50,76)
	if( yes == 1 )
	{
	D("각종 요리를 만들 수 있는 기술을 초보 요리사들에게 전수하고 있지.")
	SetQuestNumStep(50,77)
	goto END03_
	}
	CmpQuestNumStep(50,77)
	if( yes == 1 )
	{
	D("그들을 위해, 특별히 대장간에서 만든 쿠커도 판매하고 있다네.")
	SetQuestNumStep(50,78)
	goto END03_
	}
	CmpQuestNumStep(50,78)
	if( yes == 1 )
	{
	D("연금술사가 만든 컵이랑 빈병도 팔고 있으니까.")
	SetQuestNumStep(50,79)
	goto END03_
	}
	CmpQuestNumStep(50,79)
	if( yes == 1 )
	{
	D( "많이 애용하기 바래...")
	goto END03_
	SetQuestNumStep(50,82)
	}
:END03_	
	CallSmallMenu( 0, 20 )
end
@Npc00004	
;푸줏간 50번 퀘스트 90번 부터 사용한다.
;
	;앞에.. 유의 할점 시작 번호보다 낮은 값은 시작 값으로 맞춰주거,
	; 끝 번호 보다 높은 값은 시작 값으로 맞춰준다.
	CmpQuestNumStep(50,90)
	if( yes == 0 )
	{
	D("우리 집안은 대대로 백정의 집안이야.")
	SetQuestNumStep(50,90)
	goto END04_
	}
	CmpQuestNumStep(50,94)
	if( yes == 2 )
	{
	D("우리 집안은 대대로 백정의 집안이야.")
	SetQuestNumStep(50,90)
	goto END04_
	}
	CmpQuestNumStep(50,90)
	if( yes == 1 )
	{
	D("언제나 신선한 고기만을 취급하고 있다네.")
	SetQuestNumStep(50,91)
	goto END04_
	}
	CmpQuestNumStep(50,91)
	if( yes == 1 )
	{
	D( "푸줏간에서는 죽은 동물에서 고기와 가죽을 팔고 있어..")
	SetQuestNumStep(50,92)
	goto END04_
	}
	CmpQuestNumStep(50,92)
	if( yes == 1 )
	{
	D("언제나 도축자들이 우리집에 신선한 고기와 가죽을 공급해주고 있지.")
	SetQuestNumStep(50,93)
	goto END04_
	}
	CmpQuestNumStep(50,93)
	if( yes == 1 )
	{
	D( "그리고 도축자들에게 도축기술도 가르치고 있다네...")
	SetQuestNumStep(50,94)
	goto END04_
	}
	CmpQuestNumStep(50,94)
	if( yes == 1 )
	{
	D("그게 다 마을 사람들에게 좋은 고기를 공급하려는 노력중의 하나야.")
	SetQuestNumStep(50,95)
	goto END04_
	}
:END04_	
	CallSmallMenu( 0, 22 )	
end
@Npc00005	
;약초점 50번 퀘스트 110번 부터 사용한다.
;
	;앞에.. 유의 할점 시작 번호보다 낮은 값은 시작 값으로 맞춰주거,
	; 끝 번호 보다 높은 값은 시작 값으로 맞춰준다.
	CmpQuestNumStep(50,110)
	if( yes == 0 )
	{
	D("약초점에서는 당연히 약초를 팔고 있다네.")
	SetQuestNumStep(50,110)
	goto END05_
	}
	CmpQuestNumStep(50,113)
	if( yes == 2 )
	{
	D("약초점에서는 당연히 약초를 팔고 있다네.")
	SetQuestNumStep(50,110)
	goto END05_
	}
	CmpQuestNumStep(50,110)
	if( yes == 1 )
	{
	D("약초뿐 아니라, 흡수가 빠르고 약효가 더 좋은 약초가루도 팔고 있지.")
	SetQuestNumStep(50,111)
	goto END05_
	}
	CmpQuestNumStep(50,111)
	if( yes == 1 )
	{
	D( "헌데, 약초가루는 조금 더 비싸게 팔고 있지.")
	SetQuestNumStep(50,112)
	goto END05_
	}
	CmpQuestNumStep(50,112)
	if( yes == 1 )
	{
	D("약초가루가 약초보다 비싼건 당연한 거지.")
	SetQuestNumStep(50,113)
	goto END05_
	}
	CmpQuestNumStep(50,113)
	if( yes == 1 )
	{
	D("심마니가 약초를 가공하는 데에는 더 많은 손이 필요하거든.")
	SetQuestNumStep(50,114)
	goto END05_
	}
:END05_	
	CallSmallMenu( 0, 21 )
end
@Npc00006	
;점성술사의 집 50번 퀘스트 130번 부터 사용한다.
;
	;앞에.. 유의 할점 시작 번호보다 낮은 값은 시작 값으로 맞춰주거,
	; 끝 번호 보다 높은 값은 시작 값으로 맞춰준다.
	CmpQuestNumStep(50,130)
	if( yes == 0 )
	{
	D("나는 점성술사라고 해. 마법을 잘 다룰 줄 알지.")
	SetQuestNumStep(50,130)
	goto END06_
	}
	CmpQuestNumStep(50,144)
	if( yes == 2 )
	{
	D("나는 점성술사라고 해. 마법을 잘 다룰 줄 알지.")
	SetQuestNumStep(50,130)
	goto END06_
	}
	CmpQuestNumStep(50,130)
	if( yes == 1 )
	{
	D("나는 할말이 많아. 원래 마법사들이 말도 많고 싸이코가 많아.")
	SetQuestNumStep(50,131)
	goto END06_
	}
	CmpQuestNumStep(50,131)
	if( yes == 1 )
	{
	D("우리들은 전투에 있어서 필수품인 힐링포션을 만들지.")
	SetQuestNumStep(50,132)
	goto END06_
	}
	CmpQuestNumStep(50,132)
	if( yes == 1 )
	{
	D("힐링포션뿐 아니라, 마나포션과 풀포션도 만들고 있다네.")
	SetQuestNumStep(50,133)
	goto END06_
	}
	CmpQuestNumStep(50,133)
	if( yes == 1 )
	{
	D("풀포션은 빨간게이지랑 파란게이지를 둘 다 채워주지.")
	SetQuestNumStep(50,134)
	goto END06_
	}
	CmpQuestNumStep(50,134)
	if( yes == 1 )
	{
	D("빨간색 게이지는 Life 수치이고...")
	SetQuestNumStep(50,135)
	goto END06_
	}
	CmpQuestNumStep(50,135)
	if( yes == 1 )
	{
	D( "파란색 게이지는 Mana라는 것쯤은 알겠지?")
	SetQuestNumStep(50,136)
	goto END06_
	}
	CmpQuestNumStep(50,136)
	if( yes == 1 )
	{
	D("자네가 성직자 Spell을 선택했다면, 파란색 게이지가 아니라,")
	SetQuestNumStep(50,137)
	goto END06_
	}
	CmpQuestNumStep(50,137)
	if( yes == 1 )
	{
	D("디바인이라 불리는 초록색 게이지가 있을거야.")
	SetQuestNumStep(50,138)
	goto END06_
	}
	CmpQuestNumStep(50,138)
	if( yes == 1 )
	{
	D("힐링포션의 재료가 트롤의 피라는 설이 있는데...")
	SetQuestNumStep(50,139)
	goto END06_
	}
	CmpQuestNumStep(50,139)
	if( yes == 1 )
	{
	D("트롤의 몸이 재생하는 것 때문에, 그렇게들 생각하는 듯...")
	SetQuestNumStep(50,140)
	goto END06_
	}
	CmpQuestNumStep(50,140)
	if( yes == 1 )
	{
	D("하지만, 우리는 연금술사들이 만들어다 주지.")
	SetQuestNumStep(50,141)
	goto END06_
	}
	CmpQuestNumStep(50,141)
	if( yes == 1 )
	{
	D("또한, 우리들은 마법을 가르치고 있지.")
	SetQuestNumStep(50,142)
	goto END06_
	}
	CmpQuestNumStep(50,142)
	if( yes == 1 )
	{
	D("대자연의 힘을 우리는 마나라고 부르지.")
	SetQuestNumStep(50,143)
	goto END06_
	}
	CmpQuestNumStep(50,143)
	if( yes == 1 )
	{
	D( "대저 마법이라 함은 마나를 운용하는 사람의 의지라고 할 수 있지.")
	SetQuestNumStep(50,144)
	goto END06_
	}
	CmpQuestNumStep(50,144)
	if( yes == 1 )
	{
	D("그래서 마법을 배우는 데에는 지혜와 지능이 필요해.")
	SetQuestNumStep(50,145)
	goto END06_
	}
	
:END06_	
	CallSmallMenu( 0, 71 )	
end
@Npc00007	

;대장간의 50번 퀘스트 150번 부터 사용한다.
;
	;앞에.. 유의 할점 시작 번호보다 낮은 값은 시작 값으로 맞춰주거,
	; 끝 번호 보다 높은 값은 시작 값으로 맞춰준다.
	CmpQuestNumStep(50,150)
	if( yes == 0 )
	{
	D("나는 대장간 주인이야...")
	SetQuestNumStep(50,150)
	goto END07_
	}
	CmpQuestNumStep(50,157)
	if( yes == 2 )
	{
	D("나는 대장간 주인이야...")
	SetQuestNumStep(50,150)
	goto END07_
	}
	CmpQuestNumStep(50,150)
	if( yes == 1 )
	{
	D( "대장간에서는 각종 직업 도구와 무기, 방패, 갑옷 등을 팔고 있어.")
	SetQuestNumStep(50,151)
	goto END07_
	}
	CmpQuestNumStep(50,151)
	if( yes == 1 )
	{
	D("철로 된 물건들은 모두 팔고 있는 셈이지.")
	SetQuestNumStep(50,152)
	goto END07_
	}
	CmpQuestNumStep(50,152)
	if( yes == 1 )
	{
	D("그런데, 무기점이랑 방어구점에서도 철로 된 물건을 전부 취급하고 있지.")
	SetQuestNumStep(50,153)
	goto END07_
	}
	CmpQuestNumStep(50,153)
	if( yes == 1 )
	{
	D("우리 대장간과 무기점, 방어구점에서는 모두 같은 물건을 팔고 있어...")
	SetQuestNumStep(50,154)
	goto END07_
	}
	CmpQuestNumStep(50,154)
	if( yes == 1 )
	{
	D("그러니까, 대장간에 가려거든 무기점 또는 방어구점에 가도 상관없다는 의미지")
	SetQuestNumStep(50,155)
	goto END07_
	}
	CmpQuestNumStep(50,155)
	if( yes == 1 )
	{
	D("우리 대장간에서는 광부와 대장장이를 교육시키고 있어.")
	SetQuestNumStep(50,156)
	goto END07_
	}
	IsJobPC(2);광부
	if( yes == 1)
	{
		CmpQuestNumStep(50,156)
		if( yes == 1 )
		{
		D("자넨 이제 보니, 광부로군!")
		SetQuestNumStep(50,157)
		goto END07_
		}
		CmpQuestNumStep(50,157)
		if( yes == 1 )
		{
		D("광부 기술은 나한테 와서 배워야 될 거야.")
		SetQuestNumStep(50,158)
		goto END07_
		}
	}
	IsJobPC(9);대장장이
	if( yes == 1)
	{
		CmpQuestNumStep(50,156)
		if( yes == 1 )
		{
		D("자넨 이제 보니, 대장장이로군!")
		SetQuestNumStep(50,157)
		goto END07_
		}
		CmpQuestNumStep(50,157)
		if( yes == 1 )
		{
		D("대장장이 기술은 나한테 와서 배워야 될 거야.")
		SetQuestNumStep(50,158)
		goto END07_
		}
	}
	else
	{
		CmpQuestNumStep(50,156)
		if( yes == 1 )
		{
		D("마을에 대장장이가 두명이나 있지.")
		SetQuestNumStep(50,158)
		goto END07_
		}
	}
:END07_
		CallSmallMenu( 0, 18 )
end
@Npc00008

;목공소의 50번 퀘스트 170번 부터 사용한다.
;
	;앞에.. 유의 할점 시작 번호보다 낮은 값은 시작 값으로 맞춰주거,
	; 끝 번호 보다 높은 값은 시작 값으로 맞춰준다.
	CmpQuestNumStep(50,170)
	if( yes == 0 )
	{
	D("나는 목공소 주인이네...")
	SetQuestNumStep(50,170)
	goto END08_
	}
	CmpQuestNumStep(50,177)
	if( yes == 2 )
	{
	D("나는 목공소 주인이네...")
	SetQuestNumStep(50,170)
	goto END08_
	}
	CmpQuestNumStep(50,170)
	if( yes == 1 )
	{
	D("목공소에서는 나무로 만든 물건 모두를 팔고 있다네...")
	SetQuestNumStep(50,171)
	goto END08_
	}
	CmpQuestNumStep(50,171)
	if( yes == 1 )
	{
	D("목공소에서는 로드와 완드, 스태프 종류의 무기를 팔지...")
	SetQuestNumStep(50,172)
	goto END08_
	}
	CmpQuestNumStep(50,172)
	if( yes == 1 )
	{
	D("또한, 트렁크나 체스트 박스를 사서 아이템을 보관할 수 있다네..")
	SetQuestNumStep(50,173)
	goto END08_
	}
	CmpQuestNumStep(50,173)
	if( yes == 1 )
	{
	D("목공소에서는 나뭇꾼과 목수를 키워내고 있네...")
	SetQuestNumStep(50,174)
	goto END08_
	}
	CmpQuestNumStep(50,174)
	if( yes == 1 )
	{
	D("현재 나무 관련 기술을 가르쳐 주고, 재료를 알려주고 있다네..")
	SetQuestNumStep(50,176)
	goto END08_
	}
	IsJobPC(4);나뭇꾼
	if( yes == 1)
	{
		CmpQuestNumStep(50,176)
		if( yes == 1 )
		{
		D("자넨 이제 보니, 나뭇꾼이로군!")
		SetQuestNumStep(50,177)
		goto END08_
		}
		CmpQuestNumStep(50,177)
		if( yes == 1 )
		{
		D("마을에 오면 나한테 반드시 들러야 겠군.")
		SetQuestNumStep(50,178)
		goto END08_
		}
	}
	IsJobPC(8);목수
	if( yes == 1)
	{
		CmpQuestNumStep(50,176)
		if( yes == 1 )
		{
		D("자넨 이제 보니 목수로군!")
		SetQuestNumStep(50,177)
		goto END08_
		}
		CmpQuestNumStep(50,177)
		if( yes == 1 )
		{
		D("목수 기술은 나한테 와서 배워야 될 거야.")
		SetQuestNumStep(50,178)
		goto END08_
		}
	}
	else
	{
		CmpQuestNumStep(50,176)
		if( yes == 1 )
		{
		D("마을에 목수가 두명이나 있지.")
		SetQuestNumStep(50,178)
		goto END08_
		}
	}   
:END08_
		CallSmallMenu( 0, 26 )	
end
@Npc00009	
;활제작소 50번째 퀘스트 에서 190번 부터 사용한다.
	;앞에.. 유의 할점 시작 번호보다 낮은 값은 시작 값으로 맞춰주거,
	; 끝 번호 보다 높은 값은 시작 값으로 맞춰준다.
	CmpQuestNumStep(50,190)
	if( yes == 0 )
	{
	D("나는 활가게 주인이라네...")
	SetQuestNumStep(50,190)
	goto END09_
	}
	CmpQuestNumStep(50,192)
	if( yes == 2 )
	{
	D("나는 활가게 주인이라네...")
	SetQuestNumStep(50,190)
	goto END09_
	}
	CmpQuestNumStep(50,190)
	if( yes == 1 )
	{
	D("우리 가게에서는 각종 활이랑 화살, 비도 등을 팔지..")
	SetQuestNumStep(50,191)
	goto END09_
	}
	CmpQuestNumStep(50,191)
	if( yes == 1 )
	{
	D("화살 만드는데 필요한 쐐기, 목재, 깃털 등도 팔고 있다네...")
	SetQuestNumStep(50,192)
	goto END09_
	}
	CmpQuestNumStep(50,192)
	if( yes == 1 )
	{
	D("활을 사고 싶은 사람은  동시에 몰려들지.")
	SetQuestNumStep(50,193)
	goto END09_
	}
:END09_	
	CallSmallMenu( 0, 27 )	
end
@Npc00010	
;** 잡화점 50번째 퀘스트 에서 310번 부터 사용한다.
	CmpQuestNumStep(50,310)
	if( yes == 0 )
	{
	D("나는 잡화점 주인이라네...")
	SetQuestNumStep(50,310)
	goto END10_
	}
	CmpQuestNumStep(50,311)
	if( yes == 2 )
	{
	D("나는 잡화점 주인이라네...")
	SetQuestNumStep(50,310)
	goto END10_
	}
	CmpQuestNumStep(50,310)
	if( yes == 1 )
	{
	D("우리 가게에서는 각종 폭탄이랑 덫 등 잡동사니를 사고 팔지..")
	SetQuestNumStep(50,311)
	goto END10_
	}
	CmpQuestNumStep(50,311)
	if( yes == 1 )
	{
	D("우리 가게에서는 각종 폭탄이랑 덫 등 잡동사니를 사고 팔지..")
	SetQuestNumStep(50,312)
	goto END10_
	}
:END10_	
	CallSmallMenu( 0, 60 )
end
@Npc00011
;의류점 50번째 퀘스트 에서 210번 부터 사용한다.
	;앞에.. 유의 할점 시작 번호보다 낮은 값은 시작 값으로 맞춰주거,
	; 끝 번호 보다 높은 값은 시작 값으로 맞춰준다.
	CmpQuestNumStep(50,210)
	if( yes == 0 )
	{
	D("사람들은 흔히 나를 디자이너~라고 부르지...")
	SetQuestNumStep(50,210)
	goto END11_
	}
	CmpQuestNumStep(50,214)
	if( yes == 2 )
	{
	D("사람들은 흔히 나를 디자이너~라고 부르지...")
	SetQuestNumStep(50,210)
	goto END11_
	}
	CmpQuestNumStep(50,210)
	if( yes == 1 )
	{
	D("나는 마을에 옷가게를 하나 가지고 있는데 말야..")
	SetQuestNumStep(50,211)
	goto END11_
	}
	CmpQuestNumStep(50,211)
	if( yes == 1 )
	{
	D( "옷은 여러 가지 미적 감각을 자극하지.")
	SetQuestNumStep(50,212)
	goto END11_
	}
	CmpQuestNumStep(50,212)
	if( yes == 1 )
	{
	D("마법사들이 로브를 입으면 정말 폼이 나지.")
	SetQuestNumStep(50,213)
	goto END11_
	}
	CmpQuestNumStep(50,213)
	if( yes == 1 )
	{
	D("옷을 만들기 위해서는 천과 실이 꼭 필요하지.")
	SetQuestNumStep(50,214)
	goto END11_
	}
	CmpQuestNumStep(50,214)
	if( yes == 1 )
	{
	D("좋은 옷은 방어력을 올려주기도.......")
	SetQuestNumStep(50,215)
	goto END11_
	}
:END11_	
	CallSmallMenu( 0, 24 )
end
@Npc00012
;양초 제작소 50번째 퀘스트 에서 230번 부터 사용한다.
	;앞에.. 유의 할점 시작 번호보다 낮은 값은 시작 값으로 맞춰주거,
	; 끝 번호 보다 높은 값은 시작 값으로 맞춰준다.
	CmpQuestNumStep(50,230)
	if( yes == 0 )
	{
	D( "나는 초장이야... 그 유명한 네드빌씨도 바로 초쟁이지.")
	SetQuestNumStep(50,230)
	goto END12_
	}
	CmpQuestNumStep(50,233)
	if( yes == 2 )
	{
	D("나는 초장이야... 그 유명한 네드빌씨도 바로 초쟁이지.")
	SetQuestNumStep(50,230)
	goto END12_
	}
	CmpQuestNumStep(50,230)
	if( yes == 1 )
	{
	D("난, 밀납으로 양초를 만들지.")
	SetQuestNumStep(50,231)
	goto END12_
	}
	CmpQuestNumStep(50,231)
	if( yes == 1 )
	{
	D("다른 초장이에게 밀납을 팔기도 한다네..")
	SetQuestNumStep(50,232)
	goto END12_
	}
	CmpQuestNumStep(50,232)
	if( yes == 1 )
	{
	D("여기서는 밀납과 양초만 팔고 있어...")
	SetQuestNumStep(50,233)
	goto END12_
	}
	CmpQuestNumStep(50,233)
	if( yes == 1 )
	{
	D("초쟁이들은 당연히 나한테 와서 기술을 배워야돼..")
	SetQuestNumStep(50,234)
	goto END12_
	}
:END12_	
	CallSmallMenu( 0, 23 )
end
@Npc00013	
;어부 50번째 퀘스트 에서 250번 부터 사용한다.
	;앞에.. 유의 할점 시작 번호보다 낮은 값은 시작 값으로 맞춰주거,
	; 끝 번호 보다 높은 값은 시작 값으로 맞춰준다.
	CmpQuestNumStep(50,250)
	if( yes == 0 )
	{
	D("난 낚시꾼, 어부야...")
	SetQuestNumStep(50,250)
	goto END13_
	}
	CmpQuestNumStep(50,255)
	if( yes == 2 )
	{
	D("난 낚시꾼, 어부야...")
	SetQuestNumStep(50,250)
	goto END13_
	}
	CmpQuestNumStep(50,250)
	if( yes == 1 )
	{
	D("난 낚시에 필요한 낚시대와 그물을 팔고 있지...")
	CallSmallMenu( 0, 28 )
	goto END13_
	}
	CmpQuestNumStep(50,251)
	if( yes == 1 )
	{
	D("조만간 내가 만든 미끼 같은 것도 팔 예정인데...")
	SetQuestNumStep(50,252)
	goto END13_
	}
	CmpQuestNumStep(50,252)
	if( yes == 1 )
	{
	D("나도 당연히 후배 어부들을 키우고 있는 중이야...")
	SetQuestNumStep(50,253)
	goto END13_
	}
	CmpQuestNumStep(50,253)
	if( yes == 1 )
	{
	D( "물고기 낚는 기술도 점점 실력이 쌓이면,")
	SetQuestNumStep(50,254)
	goto END13_
	}
	CmpQuestNumStep(50,254)
	if( yes == 1 )
	{
	D("값비싼 물고기를 낚을 수 있지...")
	SetQuestNumStep(50,255)
	goto END13_
	}
	CmpQuestNumStep(50,255)
	if( yes == 1 )
	{
	D("그게 바로 기술이지~~!")
	SetQuestNumStep(50,256)
	goto END13_
	}
:END13_	
	CallSmallMenu( 0, 28 )
end
@Npc00014	
;알케미스트 50번째 퀘스트 에서 270번 부터 사용한다.
	;앞에.. 유의 할점 시작 번호보다 낮은 값은 시작 값으로 맞춰주거,
	; 끝 번호 보다 높은 값은 시작 값으로 맞춰준다.
	CmpQuestNumStep(50,270)
	if( yes == 0 )
	{
	D("나는 연금술사라네~")
	SetQuestNumStep(50,270)
	goto END14_
	}
	CmpQuestNumStep(50,275)
	if( yes == 2 )
	{
	D("나는 연금술사라네~")
	SetQuestNumStep(50,270)
	goto END14_
	}
	CmpQuestNumStep(50,270)
	if( yes == 1 )
	{
	D("연금술이라는 것은 여러 가지를 만드는 기술이라네...")
	SetQuestNumStep(50,271)
	goto END14_
	}
	CmpQuestNumStep(50,271)
	if( yes == 1 )
	{
	D("우리들도 구리를 금으로 만들지는 못해.")
	SetQuestNumStep(50,272)
	goto END14_
	}
	CmpQuestNumStep(50,272)
	if( yes == 1 )
	{
	D( "유리를 재료로 하는 것을 만들 수 있지.")
	SetQuestNumStep(50,273)
	goto END14_
	}
	CmpQuestNumStep(50,273)
	if( yes == 1 )
	{
	D("약초를 이용해서 포션을 만드는 것도 우리의 일이지.")
	SetQuestNumStep(50,274)
	goto END14_
	}
	CmpQuestNumStep(50,274)
	if( yes == 1 )
	{
	D( "에델브로이 신전의 의뢰를 받아 힐링포션을 만들지.")
	SetQuestNumStep(50,275)
	goto END14_
	}
	CmpQuestNumStep(50,275)
	if( yes == 1 )
	{
	D("마나포션은 마법사길드의 의뢰를 받아 만들지.")
	SetQuestNumStep(50,276)
	goto END14_
	}
:END14_	
	CallSmallMenu( 0, 25 )
end
@Npc00015	
;신전의 프리스트 50번째 퀘스트 에서 290번 부터 사용한다.
	;앞에.. 유의 할점 시작 번호보다 낮은 값은 시작 값으로 맞춰주거,
	; 끝 번호 보다 높은 값은 시작 값으로 맞춰준다.
	CmpQuestNumStep(50,290)
	if( yes == 0 )
	{
	D("나를 만나거려든 에델브로이 신전으로 오게나...")
	SetQuestNumStep(50,290)
	goto END15_
	}
	CmpQuestNumStep(50,302)
	if( yes == 2 )
	{
	D("나를 만나거려든 에델브로이 신전으로 오게나...")
	SetQuestNumStep(50,290)
	goto END15_
	}
	CmpQuestNumStep(50,290)
	if( yes == 1 )
	{
	D("인간의 생명력은 매우 짧지.")
	SetQuestNumStep(50,291)
	goto END15_
	}
	CmpQuestNumStep(50,291)
	if( yes == 1 )
	{
	D("하지만, 에델브로이의 권능이라면 가능하지.")
	SetQuestNumStep(50,292)
	goto END15_
	}
	CmpQuestNumStep(50,292)
	if( yes == 1 )
	{
	D("죽어서 유령이 되었을 때에는...")
	SetQuestNumStep(50,293)
	goto END15_
	}
	CmpQuestNumStep(50,293)
	if( yes == 1 )
	{
	D("여기 내 앞에서 주문을 외우도록 하게.")
	SetQuestNumStep(50,294)
	goto END15_
	}
	CmpQuestNumStep(50,294)
	if( yes == 1 )
	{
	D("<코스모스와 대폭풍의 에델브로이 이름으로> 라고 말이야...")
	SetQuestNumStep(50,295)
	goto END15_
	}
	CmpQuestNumStep(50,295)
	if( yes == 1 )
	{
	D("마을에 간다면 에델브로이 신전으로 찾아오게나....")
	SetQuestNumStep(50,296)
	goto END15_
	}
	CmpQuestNumStep(50,296)
	if( yes == 1 )
	{
	D( "그럼 언제나 부활이 가능하지.")
	SetQuestNumStep(50,297)
	goto END15_
	}
	CmpQuestNumStep(50,297)
	if( yes == 1 )
	{
	D("다른 곳에서 죽었을 때에는 신전안에서만 주문이 가능하다네.")
	SetQuestNumStep(50,298)
	goto END15_
	}
	CmpQuestNumStep(50,298)
	if( yes == 1 )
	{
	D("만일 성직자가 부활을 시켜만 준다면,")
	SetQuestNumStep(50,299)
	goto END15_
	}
	CmpQuestNumStep(50,299)
	if( yes == 1 )
	{
	D( "신전까지 걸어오는 수고를 덜 수 있지.")
	SetQuestNumStep(50,300)
	goto END15_
	}
	CmpQuestNumStep(50,300)
	if( yes == 1 )
	{
	D("코스모스와 대폭풍의 에델브로이 이름으로")
	SetQuestNumStep(50,301)
	goto END15_
	}
	CmpQuestNumStep(50,301)
	if( yes == 1 )
	{
	D("이렇게 말하면 다시 살아 날 수 있지... 죽을때를 대비해서 외워두게나.")
	SetQuestNumStep(50,302)
	goto END15_
	}
	CmpQuestNumStep(50,302)
	if( yes == 1 )
	{
	D("마을에서는 에델브로이 신전에 와서 주문을 외우면 다시 살아 날 수 있다네.")
	SetQuestNumStep(50,303)
	goto END15_
	}
:END15_	
end
@Npc00016
end
@Npc00017	
end
@Npc00018   
end
@Npc00019	
end
@Npc00020	; X-mas
;;//////////////////////
;;/// Merry Chrismas ///
;;//////////////////////

	IsItemHavePC(8147,3) ; 갑옷에 산타옷(8147)을 입고 있음을 체크
	if( yes == 1 )
	{
		IsInvHavePC(3047)
		if( yes == 1 )
		{
			D("메리 크리스마스~! 선물이 아직 남아있군. 선물을 아직 못 받은 사람들이 많을거야.")
			goto ENDsanta_
		}
		IsInvHavePC(3048)
		if( yes == 1 )
		{
			D("메리 크리스마스~! 선물이 아직 남아있군. 선물을 아직 못 받은 사람들이 많을거야.")
			goto ENDsanta_
		}
		IsInvHavePC(3049)
		if( yes == 1 )
		{
			D("메리 크리스마스~! 선물이 아직 남아있군. 선물을 아직 못 받은 사람들이 많을거야.")
			goto ENDsanta_
		}
		IsInvHavePC(3050)
		if( yes == 1 )
		{
			D("메리 크리스마스~! 선물이 아직 남아있군. 선물을 아직 못 받은 사람들이 많을거야.")
			goto ENDsanta_
		}
		IsInvHavePC(10106)
		if( yes == 1 )
		{
			D("메리 크리스마스~! 선물이 아직 남아있군. 선물을 아직 못 받은 사람들이 많을거야.")
			goto ENDsanta_
		}
		IsInvHavePC(10108)
		if( yes == 1 )
		{
			D("메리 크리스마스~! 선물이 아직 남아있군. 선물을 아직 못 받은 사람들이 많을거야.")
			goto ENDsanta_
		}
		IsInvHavePC(10109)
		if( yes == 1 )
		{
			D("메리 크리스마스~! 선물이 아직 남아있군. 선물을 아직 못 받은 사람들이 많을거야.")
			goto ENDsanta_
		}
		IsInvHavePC(8148)
		if( yes == 1 )
		{
			D("메리 크리스마스~! 선물이 아직 남아있군. 선물을 아직 못 받은 사람들이 많을거야.")
			goto ENDsanta_
		}
		IsInvHavePC(8149)
		if( yes == 1 )
		{
			D("메리 크리스마스~! 선물이 아직 남아있군. 선물을 아직 못 받은 사람들이 많을거야.")
			goto ENDsanta_
		}
		IsInvHavePC(8150)
		if( yes == 1 )
		{
			D("메리 크리스마스~! 선물이 아직 남아있군. 선물을 아직 못 받은 사람들이 많을거야.")
			goto ENDsanta_
		}
		IsInvHavePC(10110)
		if( yes == 1 )
		{
			D("메리 크리스마스~! 선물이 아직 남아있군. 선물을 아직 못 받은 사람들이 많을거야.")
			goto ENDsanta_
		}
		IsInvHavePC(10112)
		if( yes == 1 )
		{
			D("메리 크리스마스~! 선물이 아직 남아있군. 선물을 아직 못 받은 사람들이 많을거야.")
			goto ENDsanta_
		}
		IsInvHavePC(10113)
		if( yes == 1 )
		{
			D("메리 크리스마스~! 선물이 아직 남아있군. 선물을 아직 못 받은 사람들이 많을거야.")
			goto ENDsanta_
		}
		IsInvHavePC(10114)
		if( yes == 1 )
		{
			D("메리 크리스마스~! 선물이 아직 남아있군. 선물을 아직 못 받은 사람들이 많을거야.")
			goto ENDsanta_
		}
		IsInvHavePC(10115)
		if( yes == 1 )
		{
			D("메리 크리스마스~! 선물이 아직 남아있군. 선물을 아직 못 받은 사람들이 많을거야.")
			goto ENDsanta_
		}
		IsInvHavePC(10117)
		if( yes == 1 )
		{
			D("메리 크리스마스~! 선물이 아직 남아있군. 선물을 아직 못 받은 사람들이 많을거야.")
			goto ENDsanta_
		}
		IsInvHavePC(10118)
		if( yes == 1 )
		{
			D("메리 크리스마스~! 선물이 아직 남아있군. 선물을 아직 못 받은 사람들이 많을거야.")
			goto ENDsanta_
		}
		IsInvHavePC(10107)
		if( yes == 1 )
		{
			D("메리 크리스마스~! 선물이 아직 남아있군. 선물을 아직 못 받은 사람들이 많을거야.")
			goto ENDsanta_
		}
		IsInvHavePC(10116)
		if( yes == 1 )
		{
			D("메리 크리스마스~! 선물이 아직 남아있군. 선물을 아직 못 받은 사람들이 많을거야.")
			goto ENDsanta_
		}
		IsInvHavePC(10119)
		if( yes == 1 )
		{
			D("메리 크리스마스~! 선물이 아직 남아있군. 선물을 아직 못 받은 사람들이 많을거야.")
			goto ENDsanta_
		}

		else
		{
			D("Merry Christmas~!! 이 선물들을 사람들에게 나누어 주게.")
			QuestSound(15000) ;
			EventMsg("당신은 오늘 산타클로스로서 사람들에게 선물을 나누어 줄 수 있습니다.")
;; 1묶음
			SetItemInvPC(0,3047,50) ;거위요리
			SetItemInvPC(0,3048,50)

			SetItemInvPC(0,3049,50) ; 케잌
			SetItemInvPC(0,3050,50)

			SetItemInvPC(0,10106,50)
			SetItemInvPC(0,10108,50)
			SetItemInvPC(0,10109,50)
			SetItemInvPC(0,8148,50)
			SetItemInvPC(0,8149,50)
			SetItemInvPC(0,8150,50)

			SetItemInvPC(0,10110,50) ; 인형
			SetItemInvPC(0,10112,50)

			SetItemInvPC(0,10113,50) ; 팽이
			SetItemInvPC(0,10114,50)
			SetItemInvPC(0,10115,50)

;			SetItemInvPC(0,10117,50) ; 로보트
;			SetItemInvPC(0,10118,50)

; 2묶음
			SetItemInvPC(0,3047,50) ;거위요리
			SetItemInvPC(0,3048,50)

			SetItemInvPC(0,3049,50) ; 케잌
			SetItemInvPC(0,3050,50)

			SetItemInvPC(0,10106,50)
			SetItemInvPC(0,10108,50)
			SetItemInvPC(0,10109,50)
			SetItemInvPC(0,8148,50)
			SetItemInvPC(0,8149,50)
			SetItemInvPC(0,8150,50)

			SetItemInvPC(0,10110,50) ; 인형
			SetItemInvPC(0,10112,50)

			SetItemInvPC(0,10113,50) ; 팽이
			SetItemInvPC(0,10114,50)
			SetItemInvPC(0,10115,50)

;			SetItemInvPC(0,10117,50) ; 로보트
;			SetItemInvPC(0,10118,50)

			random( 0, 10 )
			if ( ran == 1 )
			{
				SetItemInvPC(0,10107,50)	; 희소한 여자인형 선물을 인벤토리에 채워준다.
				goto ENDsanta_
			}
			else
			{
				SetItemInvPC(0,10110,50)	; 선물을 인벤토리에 채워준다.
				goto ENDsanta_
			}

			random( 0, 10 )
			if ( ran == 1 )
			{
				SetItemInvPC(0,10116,50)	; 희소한 팽이 선물을 인벤토리에 채워준다.
				goto ENDsanta_
			}
			else
			{
				SetItemInvPC(0,10115,50)	; 선물을 인벤토리에 채워준다.
				goto ENDsanta_
			}

;;			random( 0, 10 )
;;			if ( ran == 1 )
;;			{
;;				SetItemInvPC(0,10119,50)	; 희소한 로보트를 인벤토리에 채워준다.
;;				goto ENDsanta_
;;			}
			else
			{
				SetItemInvPC(0,10117,50)	; 선물을 인벤토리에 채워준다.
				goto ENDsanta_
			}
		}
	}

	else
	{
		D( "Merry Christmas~ 산타에게 선물을 받고 싶지 않나??" )
		goto ENDsanta_
	}

:ENDsanta_

end
@Npc00021	
end
@Npc00022	
end
@Npc00023	
end
@Npc00024	
end
@Npc00025	
end
@Npc00026	
end
@Npc00027	
end
@Npc00028   
end
@Npc00029	
end
@Npc00030	
end
@Npc00031	
end
@Npc00032	
end
@Npc00033	
end
@Npc00034	
end
@Npc00035	
end
@Npc00036	
end
@Npc00037	
end
@Npc00038   
end
@Npc00039	
end

@Npc00040	
end
@Npc00041	
end
@Npc00042	
end
@Npc00043	
end
@Npc00044	
end
@Npc00045	
end
@Npc00046	
end
@Npc00047	
end
@Npc00048	; 구세군

end
@Npc00049	; 적십자

end

@Event00001
        CheckNation(3)
        if( yes == 1)
        {
	        EventMsg("바이서스 영지인 헬턴트마을로 진입합니다.")
        	QuestSound(15007)
		MapMove( "Ma-in", 216, 65 )
		goto ENDnation_
        }
        CheckNation(4)
        if( yes == 1)
        {
	        EventMsg("자이펀 점령지인 레너스시로 진입합니다.")
        	QuestSound(15007)
		MapMove( "Renes_c", 222, 208)
		goto ENDnation_
        }
	else
	{
	        EventMsg("당신은 국적이 없어서 다른 곳으로 갈 수 없습니다.")
        	QuestSound(15007)
		goto ENDnation_
        }
:ENDnation_
end

@Event00002	
	
end
@Event00003		
end
@Event00004		
end
@Event00005		
end
@Event00006		
end
@Event00007		
end
@Event00008		
end
@Event00009		
end


@Event00010		
end
@Event00011		
end
@Event00012		
end
@Event00013		
end
@Event00014		
end
@Event00015		
end
@Event00016		
end
@Event00017		
end
@Event00018		
end
@Event00019		
end





