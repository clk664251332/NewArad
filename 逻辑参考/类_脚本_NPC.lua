--==============================================================================--
--╭━━╮┏━━╮╭━━╮╭━━╮╭╭╮╮╭━━╮　╭╭╮╮╭━━╮╭╮╭╮╭━━╮
--┃╭━╯┃╭╮┃┃╭━╯┃╭╮┃┃　　┃┃╭━╯　┃　　┃┃╭╮┃┃╰╯┃┃╭━╯
--┃╰━╮┃┃┃┃┃┃╭╮┃╰╯┃┃┃┃┃┃╰━╮　┃┃┃┃┃╰╯┃┃　╭╯┃╰━╮
--┃╭━╯┃┃┃┃┃┃┃┃┃╭╮┃┃╭╮┃┃╭━╯　┃╭╮┃┃╭╮┃┃　╰╮┃╭━╯
--┃╰━╮┃╰╯┃┃╰╯┃┃┃┃┃┃┃┃┃┃╰━╮　┃┃┃┃┃┃┃┃┃╭╮┃┃╰━╮
--╰━━╯┗━━╯╰━━╯╰╯╰╯╰╯╰╯╰━━╯  ╰╯╰╯╰╯╰╯╰╯╰╯╰━━╯
--
-- 作者:  创建:2011年4月26日22时43分13秒
--=============================================================================--

Q_NPC脚本组 = {}

Q_NPC脚本组["艾尔文防线_铁匠"] = {

	Main =   function ()			
				Q_菜单:打开("艾尔文防线_铁匠",
				{
					跳转_NPC对话 = function ()
									Q_NPC对话框:打开("艾尔文防线_铁匠","铁匠林纳斯",-20,-65)
									Q_NPC对话框:提示(
									[[
									<HC>年轻人！你对这个世界很迷惑吧？别担心，我会帮你的。#
									<HC>首先，请你记住下面的操作方式。
									]],
									[[
									<HC>如果你想右、左、上、下移动，就按键盘上对应的[→、←、#
									<HC>↑、↓]键。
									]]
									)
									
								    end,
								    
						__物品  = function ()
										
									Q_系统:打开商店("艾尔文防线_铁匠",
													[[
													你要空手回去？那多丢脸
													啊，还是来看看我的物品
													吧，保证能找到你满意的
													！
													]],
													3,
													"1|1|初级HP恢复药水","1|2|初级MP恢复药水",
													"2|1|艾尔文防线回城卷","2|2|前踢","2|3|下段踢")
								    end,
								    
				},
				"对话@跳转_NPC对话",
				"物品@__物品"
				)
				
			end

}

