--==============================================================================--
--╭━━╮┏━━╮╭━━╮╭━━╮╭╭╮╮╭━━╮　╭╭╮╮╭━━╮╭╮╭╮╭━━╮
--┃╭━╯┃╭╮┃┃╭━╯┃╭╮┃┃　　┃┃╭━╯　┃　　┃┃╭╮┃┃╰╯┃┃╭━╯
--┃╰━╮┃┃┃┃┃┃╭╮┃╰╯┃┃┃┃┃┃╰━╮　┃┃┃┃┃╰╯┃┃　╭╯┃╰━╮
--┃╭━╯┃┃┃┃┃┃┃┃┃╭╮┃┃╭╮┃┃╭━╯　┃╭╮┃┃╭╮┃┃　╰╮┃╭━╯
--┃╰━╮┃╰╯┃┃╰╯┃┃┃┃┃┃┃┃┃┃╰━╮　┃┃┃┃┃┃┃┃┃╭╮┃┃╰━╮
--╰━━╯┗━━╯╰━━╯╰╯╰╯╰╯╰╯╰━━╯  ╰╯╰╯╰╯╰╯╰╯╰╯╰━━╯
--
-- 作者:  创建:2010年10月19日21时42分28秒
--=============================================================================--

类_新PAK类  = class()



--=============================================================================--
-- ■ 构造函数
--=============================================================================--
function 类_新PAK类:初始化(PAK标识,首帧,是否压缩)
	
	
	self.临时位置 = {x=0,y=0}
	self.中心点 ={x=0,y=0}

	self.可视 = true

	self.首帧  = 1
	if (首帧 ~= nil and 首帧 > 0 ) then 
		self.首帧 = 首帧 
	end 
	
	self.动画资源 = 取PAK缓存(PAK标识)
	
	
	self.cx = 0
	self.cy = 0
	
	self.影子可视 = false 
	self.影子透明度 = 80
	self.影子y偏移 = 70
	self.影子_跳跃偏移 = {x=0,y=0}
	
	
	self.边线可视 = false
	self.边线透明度 = 120
	self.边线透明控制变量 = 5
	self.发光档次 = 0
	
	
	self.混合 = 混合_默认
	self.停止 = false
	self.是否压缩 = 是否压缩
	self.总帧数 = table.getn(self.动画资源.PAK信息组)
	

	if(self.动画资源.PAK信息组[self.首帧].图片 == nil) then
		self.动画资源.PAK信息组[self.首帧].图片 =  引擎:载入图片_PAK (self.动画资源.文件号,self.动画资源.PAK信息组[self.首帧].偏移,self.动画资源.PAK信息组[self.首帧].图片大小,self.是否压缩 )
		self.动画资源.PAK信息组[self.首帧].帧宽 =引擎:取图片宽度(self.动画资源.PAK信息组[self.首帧].图片)
		self.动画资源.PAK信息组[self.首帧].帧高 =引擎:取图片高度(self.动画资源.PAK信息组[self.首帧].图片)
		self.动画资源.PAK信息组[self.首帧].精灵 = __ED_创建精灵(self.动画资源.PAK信息组[self.首帧].图片,0,0,self.动画资源.PAK信息组[self.首帧].帧宽,self.动画资源.PAK信息组[self.首帧].帧高)	
	end
	
	
	

	
	
	
	self.碎图片精灵 = self.动画资源.PAK信息组[self.首帧].精灵
	self.临时宽度 = self.动画资源.PAK信息组[self.首帧].帧宽
	self.临时高度 = self.动画资源.PAK信息组[self.首帧].帧高
	
	
	
	

	
	
	
	
	
	

	self.开始帧 = 1
	self.结束帧 = 1
	self.当前帧 = self.首帧

	self.全局计次 = 0
	self.时间累积 = 0

	self.进度值  = 1
	self.动画包围盒 = D2D_包围盒.创建 ( 0, 0, self.临时宽度, self.临时高度)

	
	self.颜色值 = 颜色_白
	self.包围盒显示 = false 



end


--=============================================================================--
-- ■ 反向更新()
--=============================================================================--

function 类_新PAK类:反向更新(动画帧率,开始帧,结束帧) 
	
	if (self.停止 or self.可视==false) then 
		return 
	end 
	
	self.时间累积 = self.时间累积 + 0.02

	if ( 开始帧 == nil) then
		self.开始帧 = self.总帧数 
		self.结束帧 = 1

	else

		self.开始帧 = 结束帧
		self.结束帧 = 开始帧
	end
	
	
	if (self.时间累积 > 动画帧率/100) then

		self.全局计次 = self.全局计次 + 1
		self.时间累积 = 0

	end
	
	

	if (self.全局计次 >  self.开始帧 - self.结束帧) then
		self.全局计次 = 0
	end
	

	self.当前帧 =  self.开始帧 -  self.全局计次


	if (self.当前帧 >= 1) then
		
		if (self.动画资源.PAK信息组[self.当前帧].图片 == nil) then
			self.动画资源.PAK信息组[self.当前帧].图片 =  引擎:载入图片_PAK (self.动画资源.文件号,self.动画资源.PAK信息组[self.当前帧].偏移,self.动画资源.PAK信息组[self.当前帧].图片大小,self.是否压缩 )
			self.动画资源.PAK信息组[self.当前帧].帧宽 =引擎:取图片宽度(self.动画资源.PAK信息组[self.当前帧].图片)
			self.动画资源.PAK信息组[self.当前帧].帧高 =引擎:取图片高度(self.动画资源.PAK信息组[self.当前帧].图片)
			self.动画资源.PAK信息组[self.当前帧].精灵 = __ED_创建精灵(self.动画资源.PAK信息组[self.当前帧].图片,0,0,self.动画资源.PAK信息组[self.当前帧].帧宽,self.动画资源.PAK信息组[self.当前帧].帧高)
		end 
		
		self.碎图片精灵 = self.动画资源.PAK信息组[self.当前帧].精灵
		
	end


end 






--=============================================================================--
-- ■ 更新()
--=============================================================================--

function 类_新PAK类:更新(动画帧率,开始帧,结束帧)

	if (self.停止 or self.可视==false) then 
		return 
	end 
	
	self.时间累积 = self.时间累积 + 0.02

	if ( 开始帧 == nil) then
		self.开始帧 = 1
		self.结束帧 = self.总帧数 

	else

		self.开始帧 = 开始帧
		self.结束帧 = 结束帧
	end
	

	if (self.时间累积 > 动画帧率/100) then

		self.全局计次 = self.全局计次 + 1
		self.时间累积 = 0

	end
	

	if (self.全局计次 > self.结束帧 - self.开始帧) then
		self.全局计次 = 0
	end
	

	self.当前帧 = self.全局计次 + self.开始帧


	if (self.当前帧 <= self.总帧数) then
		
		if (self.动画资源.PAK信息组[self.当前帧].图片 == nil) then
			self.动画资源.PAK信息组[self.当前帧].图片 =  引擎:载入图片_PAK (self.动画资源.文件号,self.动画资源.PAK信息组[self.当前帧].偏移,self.动画资源.PAK信息组[self.当前帧].图片大小,self.是否压缩 )
			self.动画资源.PAK信息组[self.当前帧].帧宽 =引擎:取图片宽度(self.动画资源.PAK信息组[self.当前帧].图片)
			self.动画资源.PAK信息组[self.当前帧].帧高 =引擎:取图片高度(self.动画资源.PAK信息组[self.当前帧].图片)
			self.动画资源.PAK信息组[self.当前帧].精灵 = __ED_创建精灵(self.动画资源.PAK信息组[self.当前帧].图片,0,0,self.动画资源.PAK信息组[self.当前帧].帧宽,self.动画资源.PAK信息组[self.当前帧].帧高)
		end 
		
		self.碎图片精灵 = self.动画资源.PAK信息组[self.当前帧].精灵
		
	end
	
	
	
	
	
	




end


--=============================================================================--
-- ■ 置当前帧()
--=============================================================================--

function 类_新PAK类:置当前帧(帧)

	self.当前帧  = 帧

	if (self.动画资源.PAK信息组[self.当前帧].图片 == nil) then
		self.动画资源.PAK信息组[self.当前帧].图片 =  引擎:载入图片_PAK (self.动画资源.文件号,self.动画资源.PAK信息组[self.当前帧].偏移,self.动画资源.PAK信息组[self.当前帧].图片大小,self.是否压缩 )
		self.动画资源.PAK信息组[self.当前帧].帧宽 =引擎:取图片宽度(self.动画资源.PAK信息组[self.当前帧].图片)
		self.动画资源.PAK信息组[self.当前帧].帧高 =引擎:取图片高度(self.动画资源.PAK信息组[self.当前帧].图片)
		self.动画资源.PAK信息组[self.当前帧].精灵 = __ED_创建精灵(self.动画资源.PAK信息组[self.当前帧].图片,0,0,self.动画资源.PAK信息组[self.当前帧].帧宽,self.动画资源.PAK信息组[self.当前帧].帧高)
	end 
	
	self.碎图片精灵 = self.动画资源.PAK信息组[self.当前帧].精灵
	
	
	
	
	
	

end 

--=============================================================================--
-- ■ 往返更新()
--=============================================================================--

function 类_新PAK类:往返更新(动画帧率,开始帧,结束帧)

	if (self.停止 or self.可视==false) then 
		return 
	end 
	
	self.时间累积 = self.时间累积 + 0.02

	if ( 开始帧 == nil) then
		self.开始帧 = 1
		self.结束帧 = self.总帧数 

	else

		self.开始帧 = 开始帧
		self.结束帧 = 结束帧
	end


	if(self.全局计次 == 0)then
		self.进度值 = 1
	end

	if(self.全局计次 + self.开始帧 == self.结束帧)then
		self.进度值 = -1
	end



	if (self.时间累积 > 动画帧率/100) then

		self.全局计次 = self.全局计次 + self.进度值
		self.时间累积 = 0

	end
	
	self.当前帧  = self.全局计次 + self.开始帧
	
	
	
	if (self.动画资源.PAK信息组[self.当前帧].图片 == nil) then
		self.动画资源.PAK信息组[self.当前帧].图片 =  引擎:载入图片_PAK (self.动画资源.文件号,self.动画资源.PAK信息组[self.当前帧].偏移,self.动画资源.PAK信息组[self.当前帧].图片大小,self.是否压缩 )
		self.动画资源.PAK信息组[self.当前帧].帧宽 =引擎:取图片宽度(self.动画资源.PAK信息组[self.当前帧].图片)
		self.动画资源.PAK信息组[self.当前帧].帧高 =引擎:取图片高度(self.动画资源.PAK信息组[self.当前帧].图片)
		self.动画资源.PAK信息组[self.当前帧].精灵 = __ED_创建精灵(self.动画资源.PAK信息组[self.当前帧].图片,0,0,self.动画资源.PAK信息组[self.当前帧].帧宽,self.动画资源.PAK信息组[self.当前帧].帧高)
	end 
		
	self.碎图片精灵 = self.动画资源.PAK信息组[self.当前帧].精灵

	
--	__ED_精灵_置渲染区域(self.碎图片精灵,0,0,__ED_精灵_取宽度(self.碎图片精灵),__ED_精灵_取高度(self.碎图片精灵))

	
end



--=============================================================================--
-- ■ 显示()
--=============================================================================--

function 类_新PAK类:显示(x,y,w,h,旋转,高级逻辑)

	if (self.可视==false) then
		return
	end
	
	if (w == nil) then
		w = 1
	end
	
	if (h == nil) then
		h = 1
	end

	if (旋转 == nil) then
		旋转 = 0
	end
	
	
	if (高级逻辑 ~= false )then 	
		self.动画包围盒:置宽高 (__ED_精灵_取宽度(self.碎图片精灵)* math.abs(w), __ED_精灵_取高度(self.碎图片精灵) *math.abs( h))
	end 
	
	if (self.当前帧 <= self.总帧数) then

		if (self.当前帧 > 0) then
				self.临时位置.x = x + self.动画资源.PAK信息组[self.当前帧].中心x * w
				self.临时位置.y = y + self.动画资源.PAK信息组[self.当前帧].中心y * h
				
			if (高级逻辑 ~= false )then 	
				if ( w > 0 ) then
					
					self.动画包围盒:置位置 (self.临时位置.x -self.中心点.x * w,self.临时位置.y-self.中心点.y* h)
					
					if (self.影子可视) then 
						__ED_置精灵翻转(self.碎图片精灵,false,false,false)
						self.cx = self.临时位置.x -self.中心点.x * w
						self.cy = self.临时位置.y-self.中心点.y * h
						
						
					end 
					
				else
				
					self.动画包围盒:置位置 (self.临时位置.x + self.中心点.x -self.中心点.x*(1+w)-__ED_精灵_取宽度(self.碎图片精灵) * math.abs(w) , self.临时位置.y-self.中心点.y * h)
					
					if (self.影子可视) then 
						__ED_置精灵翻转(self.碎图片精灵,true,false,false)
						self.cx = self.临时位置.x + self.中心点.x-self.中心点.x*(1+w)- __ED_精灵_取宽度(self.碎图片精灵) * math.abs(w)
						self.cy = self.临时位置.y-self.中心点.y* h 
						
					end 
					

				end
			end 
			
		end

	end
	
	
	
	
	if (self.影子可视) then 
	
		__ED_置精灵渲染色(self.碎图片精灵,ARGB(self.影子透明度,0,0,0))
	
		
		__ED_置精灵显示_按顶点(self.碎图片精灵,
			self.cx -__ED_精灵_取高度(self.碎图片精灵)* math.abs(h)*0.45 + 15 + self.影子_跳跃偏移.x,self.cy+self.影子y偏移 + self.影子_跳跃偏移.y ,
			self.cx - __ED_精灵_取高度(self.碎图片精灵)* math.abs(h)*0.45 + 10+ __ED_精灵_取宽度(self.碎图片精灵) * math.abs(w)+ self.影子_跳跃偏移.x,self.cy+self.影子y偏移 + self.影子_跳跃偏移.y ,
			self.cx + __ED_精灵_取宽度(self.碎图片精灵)* math.abs(w) + self.影子_跳跃偏移.x,self.cy + __ED_精灵_取高度(self.碎图片精灵)* math.abs(h)-10 + self.影子_跳跃偏移.y ,
			self.cx  + self.影子_跳跃偏移.x,self.cy + __ED_精灵_取高度(self.碎图片精灵)* math.abs(h)+ self.影子_跳跃偏移.y)
		
		__ED_置精灵翻转(self.碎图片精灵,false,false,false)
		__ED_置精灵渲染色(self.碎图片精灵,颜色_白)
		
	end 
	
	
	

	__ED_置精灵参照点(self.碎图片精灵,self.中心点.x - self.动画资源.PAK信息组[self.当前帧].中心x , 
							  self.中心点.y - self.动画资源.PAK信息组[self.当前帧].中心y )




	if (self.边线可视 ) then 
		__ED_精灵混合模式(self.碎图片精灵,混合_单色)
		
		self.边线透明度 = self.边线透明度 + self.边线透明控制变量
		
		if (self.边线透明度 <= 120 or self.边线透明度 >=250) then 
			self.边线透明控制变量 = -self.边线透明控制变量
		end 
		
		
		__ED_置精灵渲染色(self.碎图片精灵,ARGB(self.边线透明度 ,255,255,0))

		if ( w > 0 ) then
		
			__ED_精灵显示_高级(self.碎图片精灵,self.临时位置.x - self.动画资源.PAK信息组[self.当前帧].中心x * math.abs(w) + 1,self.临时位置.y - self.动画资源.PAK信息组[self.当前帧].中心y * math.abs(h) ,旋转,w,h)
			__ED_精灵显示_高级(self.碎图片精灵,self.临时位置.x - self.动画资源.PAK信息组[self.当前帧].中心x * math.abs(w) - 1,self.临时位置.y - self.动画资源.PAK信息组[self.当前帧].中心y * math.abs(h) ,旋转,w,h)
			__ED_精灵显示_高级(self.碎图片精灵,self.临时位置.x - self.动画资源.PAK信息组[self.当前帧].中心x * math.abs(w) ,self.临时位置.y - self.动画资源.PAK信息组[self.当前帧].中心y * math.abs(h) + 1 ,旋转,w,h)
			__ED_精灵显示_高级(self.碎图片精灵,self.临时位置.x - self.动画资源.PAK信息组[self.当前帧].中心x * math.abs(w) ,self.临时位置.y - self.动画资源.PAK信息组[self.当前帧].中心y * math.abs(h) - 1 ,旋转,w,h)
		else 
		
			__ED_精灵显示_高级(self.碎图片精灵,self.临时位置.x + self.动画资源.PAK信息组[self.当前帧].中心x * math.abs(w) + 1 ,self.临时位置.y - self.动画资源.PAK信息组[self.当前帧].中心y * math.abs(h) ,旋转,w,h)
			__ED_精灵显示_高级(self.碎图片精灵,self.临时位置.x + self.动画资源.PAK信息组[self.当前帧].中心x * math.abs(w) - 1 ,self.临时位置.y - self.动画资源.PAK信息组[self.当前帧].中心y * math.abs(h) ,旋转,w,h)
			__ED_精灵显示_高级(self.碎图片精灵,self.临时位置.x + self.动画资源.PAK信息组[self.当前帧].中心x * math.abs(w),self.临时位置.y - self.动画资源.PAK信息组[self.当前帧].中心y * math.abs(h)  + 1 ,旋转,w,h)
			__ED_精灵显示_高级(self.碎图片精灵,self.临时位置.x + self.动画资源.PAK信息组[self.当前帧].中心x * math.abs(w),self.临时位置.y - self.动画资源.PAK信息组[self.当前帧].中心y * math.abs(h)  - 1 ,旋转,w,h)

			
		end 

	end 
	




	__ED_精灵混合模式(self.碎图片精灵,self.混合)
	__ED_置精灵渲染色(self.碎图片精灵,self.颜色值)
	

	
	if ( w > 0 ) then
	
		__ED_精灵显示_高级(self.碎图片精灵,self.临时位置.x - self.动画资源.PAK信息组[self.当前帧].中心x * math.abs(w),
								self.临时位置.y - self.动画资源.PAK信息组[self.当前帧].中心y * math.abs(h) ,旋转,w,h)
	
	else 
	
		__ED_精灵显示_高级(self.碎图片精灵,self.临时位置.x + self.动画资源.PAK信息组[self.当前帧].中心x * math.abs(w),
								self.临时位置.y - self.动画资源.PAK信息组[self.当前帧].中心y * math.abs(h) ,旋转,w,h)
	
	
	end 

	
	if (self.包围盒显示) then
		self.动画包围盒:显示()
	end 
	
end









--=============================================================================--
-- ■ 置颜色()
--=============================================================================--

function 类_新PAK类:置颜色(颜色值)
	self.颜色值 = 颜色值
end


--=============================================================================--
-- ■ 重置()
--=============================================================================--

function 类_新PAK类:重置()
	
	self.时间累积 = 0
	self.全局计次 = 0

end


--=============================================================================--
-- ■ 取间隔帧()
--=============================================================================--

function 类_新PAK类:取间隔帧()
	
	return self.全局计次
end


--=============================================================================--
-- ■ 暂停()
--=============================================================================--

function 类_新PAK类:暂停()
	
	self.停止 =true
end

--=============================================================================--
-- ■ 继续()
--=============================================================================--

function 类_新PAK类:继续()
	
	self.停止 = false
end




--=============================================================================--
-- ■ 置混合()
--=============================================================================--

function 类_新PAK类:置混合(混合值)
	self.混合 = 混合值
end

--=============================================================================--
-- ■ 置中心点()
--=============================================================================--

function 类_新PAK类:置中心点(x,y)
	
	self.中心点.x = x
	self.中心点.y = y


end


--=============================================================================--
-- ■ 对象同步()
--=============================================================================--

function 类_新PAK类:对象同步(同步对象)
	
	self.当前帧 = 同步对象.当前帧
	self.时间累积 = 同步对象.时间累积
	self.全局计次 = 同步对象.全局计次

end


--=============================================================================--
-- ■ 销毁()
--=============================================================================--

function 类_新PAK类:销毁(是否清理内存,开始,结束)
	

	if (是否清理内存) then 
		
		if (开始 ==nil) then
			开始 = 1
			结束 = self.总帧数
		end
		
	
		for n=开始,结束 do 
			
			if (self.动画资源.PAK信息组[n].图片 ~= nil) then 
				引擎:销毁图片(self.动画资源.PAK信息组[n].图片)
				self.动画资源.PAK信息组[n].图片 = nil
				__ED_销毁精灵(self.动画资源.PAK信息组[n].精灵)
				self.动画资源.PAK信息组[n].精灵 = nil
			end 
			
		end 
		

--		self = nil
		
--		collectgarbage("collect")  -- 垃圾回收
		
	end 
	

	
	

end





