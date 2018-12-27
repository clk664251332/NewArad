--==============================================================================--
--╭━━╮┏━━╮╭━━╮╭━━╮╭╭╮╮╭━━╮　╭╭╮╮╭━━╮╭╮╭╮╭━━╮
--┃╭━╯┃╭╮┃┃╭━╯┃╭╮┃┃　　┃┃╭━╯　┃　　┃┃╭╮┃┃╰╯┃┃╭━╯
--┃╰━╮┃┃┃┃┃┃╭╮┃╰╯┃┃┃┃┃┃╰━╮　┃┃┃┃┃╰╯┃┃　╭╯┃╰━╮
--┃╭━╯┃┃┃┃┃┃┃┃┃╭╮┃┃╭╮┃┃╭━╯　┃╭╮┃┃╭╮┃┃　╰╮┃╭━╯
--┃╰━╮┃╰╯┃┃╰╯┃┃┃┃┃┃┃┃┃┃╰━╮　┃┃┃┃┃┃┃┃┃╭╮┃┃╰━╮
--╰━━╯┗━━╯╰━━╯╰╯╰╯╰╯╰╯╰━━╯  ╰╯╰╯╰╯╰╯╰╯╰╯╰━━╯
--
-- 作者:  创建:2011年4月25日22时21分34秒
--=============================================================================--

Q_地图脚本组 = {}

Q_地图脚本组["家"] = {
	Main =   function ()			
				Q_系统:播放背景音效("forest_town.ogg")
				Q_地图.地图_事件箱[1] = {x=410,y=420,w=160,h=70,map="艾尔文防线",map_x=812,map_y=280}
				Q_系统:显示NPC("家_赛丽亚",480,275,1)

			end

}


Q_地图脚本组["艾尔文防线"] = {
	Main =   function ()		
				Q_系统:播放背景音效("forest_town.ogg")
				Q_系统:增加屏幕特效("艾尔文铁炉", "地图坐标",400,310,1,1,0,0)		
				Q_地图.地图_事件箱[1] = {x=762,y=210,w=100,h=70,map="家",map_x=470,map_y=410}
				Q_地图.地图_事件箱[2] = {x=1565,y=200,w=100,h=400,map="艾尔文森林入口",map_x=50,map_y=360}
				Q_系统:显示NPC("艾尔文防线_铁匠",470,315,1)
			end

}

Q_地图脚本组["艾尔文森林入口"] = {
	Main =   function ()		
				Q_系统:播放背景音效("forest_town.ogg")
				Q_地图.地图_事件箱[1] = {x=0,y=0,w=30,h=600,map="艾尔文防线",map_x=1560,map_y=372}
				Q_地图.地图_事件箱[2] = {x=1030,y=0,w=100,h=600,map="艾尔文森林西部",map_x=101,map_y=320}
			end

}


Q_地图脚本组["艾尔文森林西部"] = {
	Main =   function ()			
				Q_系统:播放背景音效("forest01_new.ogg")
				Q_地图.地图_事件箱[1] = {x=0,y=232,w=60,h=100,map="艾尔文森林入口",map_x=963,map_y=365}
				Q_地图.地图_事件箱[2] = {x=3080,y=230,w=60,h=80,map="艾尔文森林中部",map_x=101,map_y=320}
				
				
			end
			

}


Q_地图脚本组["艾尔文森林中部"] = {
	Main =   function ()			
				Q_系统:播放背景音效("forest01_new.ogg")
				Q_地图.地图_事件箱[1] = {x=0,y=232,w=60,h=100,map="艾尔文森林西部",map_x=3055,map_y=330}
--				Q_地图.地图_事件箱[1] = {x=3080,y=230,w=60,h=100,map="艾尔文森林_西一",map_x=563,map_y=365}
--				
				
			end
			

}





