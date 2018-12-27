--==============================================================================--
--╭━━╮┏━━╮╭━━╮╭━━╮╭╭╮╮╭━━╮　╭╭╮╮╭━━╮╭╮╭╮╭━━╮
--┃╭━╯┃╭╮┃┃╭━╯┃╭╮┃┃　　┃┃╭━╯　┃　　┃┃╭╮┃┃╰╯┃┃╭━╯
--┃╰━╮┃┃┃┃┃┃╭╮┃╰╯┃┃┃┃┃┃╰━╮　┃┃┃┃┃╰╯┃┃　╭╯┃╰━╮
--┃╭━╯┃┃┃┃┃┃┃┃┃╭╮┃┃╭╮┃┃╭━╯　┃╭╮┃┃╭╮┃┃　╰╮┃╭━╯
--┃╰━╮┃╰╯┃┃╰╯┃┃┃┃┃┃┃┃┃┃╰━╮　┃┃┃┃┃┃┃┃┃╭╮┃┃╰━╮
--╰━━╯┗━━╯╰━━╯╰╯╰╯╰╯╰╯╰━━╯  ╰╯╰╯╰╯╰╯╰╯╰╯╰━━╯
--
-- 作者:  创建:2010年9月7日16时3分32秒
--=============================================================================--

特效_粒子特效  = class()



--=============================================================================--
-- ■ 构造函数
--=============================================================================--
function 特效_粒子特效:初始化(坐标x,坐标y,类型)

	self.标识类型 = "屏幕特效"
	self.类型 = 类型
	self.坐标 = {x=坐标x,y=坐标y}
	self.排序参照点 = 坐标y
	self.已经消失 = false
	
	if (self.类型 == "死亡烟雾") then 
		self.粒子精灵 = D2D_精灵.创建(Q_游戏数据.图片组.烟雾粒子图片,0,0,13,12)
		self.粒子精灵:置中心点(6,6)
		self.粒子 = D2D_粒子.创建("Dat/other/死亡烟雾.psi",self.粒子精灵)
	elseif (self.类型 == "落地灰层1") then 
		self.粒子精灵 = D2D_精灵.创建(Q_游戏数据.图片组.落地灰层粒子A图片,0,0,41,34)
		self.粒子精灵:置中心点(20,17)
		self.粒子 = D2D_粒子.创建("Dat/other/灰尘.psi",self.粒子精灵)
		
	elseif (self.类型 == "落地灰层2") then 
		self.粒子精灵 = D2D_精灵.创建(Q_游戏数据.图片组.落地灰层粒子B图片,0,0,36,26)
		self.粒子精灵:置中心点(18,13)
		self.粒子 = D2D_粒子.创建("Dat/other/灰尘.psi",self.粒子精灵)
		
	elseif (self.类型 == "落地灰层3") then 
		self.粒子精灵 = D2D_精灵.创建(Q_游戏数据.图片组.落地灰层粒子C图片,0,0,25,21)
		self.粒子精灵:置中心点(13,10)
		self.粒子 = D2D_粒子.创建("Dat/psi/灰尘.psi",self.粒子精灵)
		
		
		
	end 
	
	

	
	self.粒子:启动到(self.坐标.x  + Q_游戏数据.画面偏移.x ,self.坐标.y + Q_游戏数据.画面偏移.y)
	
	
	
	self.定位= true

end





--=============================================================================--
-- ■ 更新
--=============================================================================--
function 特效_粒子特效:更新()

	self.粒子:更新(dt)
	
	if(self.粒子:取粒子存活数 () == 0)then
		self.已经消失 = true 
	end


end





--=============================================================================--
-- ■ 显示
--=============================================================================--
function 特效_粒子特效:显示()

	self.粒子:移动到(self.坐标.x  + Q_游戏数据.画面偏移.x ,self.坐标.y + Q_游戏数据.画面偏移.y,self.定位)
	self.粒子:显示()
	

end



--=============================================================================--
-- ■ 移动到
--=============================================================================--
function 特效_粒子特效:移动到(x,y)
	self.坐标.x ,self.坐标.y = x,y
	self.定位 = false
end 









--=============================================================================--
-- ■ 销毁
--=============================================================================--
function 特效_粒子特效:销毁()
	
	self.粒子精灵:销毁()
	self.粒子:销毁()
	
end 

