local a=game:GetService("HttpService")local b=game:GetService("ReplicatedStorage")local c=game:GetService("Players")local d=game:GetService("UserInputService")local e=game:GetService("RunService")local f=game:GetService("ContextActionService")local g="1.2.0"loadstring(game:HttpGetAsync('https://raw.githubusercontent.com/topitbopit/Jeff-2.3-Framework/main/jtags.lua'))()local i=loadstring(game:HttpGet('https://raw.githubusercontent.com/topitbopit/Jeff-2.3-Framework/main/lib.lua'))()local j=game:GetService"Players".LocalPlayer;local k=false;local l=game:GetService("RunService")local m={}local n=false;local o=false;local p=1.5;local q=1.5;local r;local s;local t;local u;local v={}local function w(w)i.Async(function()local x=Instance.new("Part")x.CanCollide=false;x.Anchored=true;x.Parent=game.Workspace;x.Size=Vector3.new(1,1,1)x.Position=j.Character.Head.Position;x.Transparency=1;local y=Instance.new("BillboardGui")y.Parent=x;y.Size=UDim2.new(5,0,1,0)y.AlwaysOnTop=true;local z=Instance.new("TextLabel")z.Font=Enum.Font.Nunito;z.TextScaled=true;z.Text=w;z.Size=UDim2.new(1,0,1,0)z.BackgroundTransparency=1;z.TextColor3=Color3.fromRGB(255,255,255)z.TextStrokeTransparency=0;z.TextStrokeColor3=Color3.fromRGB(0,0,0)z.Parent=y;z.RichText=true;i.TweenCustom(x,{Position=x.Position+Vector3.new(0,math.random(100,180)/100,0)},1.5)wait(1.5)x:Destroy()end)end;function GetCharacter()if pcall(function()return j.Character.Head end)then return j.Character end;return nil end;function GetMesh(A)if pcall(function()return A["SpecialMesh"].VertexColor end)then return A["SpecialMesh"]end;return nil end;function netbypass_disable()for B,C in pairs(m)do C:Disconnect()end end;local function D()local E=j.Character.HumanoidRootPart.Position;local F=nil;local G=5000;for B,C in pairs(game.Players:GetPlayers())do if C.Name~=j.Name and pcall(function()return j.Character.Head end)then local H=999;pcall(function()H=(C.Character.HumanoidRootPart.Position-E).Magnitude end)if H<G then G=H;F=C end end end;return F end;local function I()pcall(function()j.Character.Humanoid.AutoRotate=true end)pcall(function()e:UnbindFromRenderStep("PlayerRotatePenoir")end)pcall(function()i.SetInstanceValue("Player_Rotate",false)i.CloseObject(i.GetInstance("Player_Rotate"))end)end;local J=function(K,L,M)K=K or"nil"L=L or Enum.RenderPriority.Character.Value+2;e:BindToRenderStep(K,L,M)end;local N=function(K)K=K or"nil"e:UnbindFromRenderStep(K)end;local O=function(K,M,P)f:BindAction(K,function(x,y)if y==Enum.UserInputState.Begin then M()end end,false,P)end;local Q=function(K)f:UnbindAction(K)end;local R=function(K,S,T,U,V)local H=i.NewTextBox(K.."Hotkey",S,T,function()local W=i.GetInstance(K.."Hotkey")local X=W.Text;if X:len()==1 then X=X:upper()end;if pcall(function()return Enum.KeyCode[X]end)then h=Enum.KeyCode[X]if("Hotkey: "..h.Name):len()>=13 then local Y=h.Name:gsub("%l","",4)if hotkeytables[h.Name]then W.Text="Hotkey: "..hotkeytables[h.Name]else W.Text="Hotkey: <font size='"..tostring(20-Y:len()).."'>"..Y.."</font>"end else W.Text="Hotkey: "..h.Name end;O(K.."Hotkey",function()i.SetInstanceValue(K,not i.GetInstanceValue(K))if i.GetInstanceValue(K)then i.OpenObject(i.GetInstance(K))U()else i.CloseObject(i.GetInstance(K))V()end end,h)else W.Text="No hotkey"Q(K.."Hotkey")end end)end;local function Z(_,a0,S)_=_ or 7;a0=a0 or 0;S=S or nil;local H=Instance.new("ImageLabel")H.Image="rbxassetid://6956257983"H.Size=UDim2.new(0,_,0,_)H.Position=UDim2.new(0,a0,0,0)H.BackgroundTransparency=1;H.ZIndex=280;H.Parent=S;return H end;local function a1(a2)i.NewBoard("",a2.Parent,{Position=UDim2.new(0,30+a2.TextBounds.X,0,a2.Position.Y.Offset+12.5),Size=UDim2.new(0,360-a2.TextBounds.X,0,2),BackgroundColor3=i.Theme.shade7,ZIndex=200})end;local function a3(a2,a4)i.NewBoard("",a2,{Position=UDim2.new(0,10,0,a4),Size=UDim2.new(0,380,0,2),BackgroundColor3=i.Theme.shade7,ZIndex=200})end;local function a5(S,a4,a6)a6=a6 or 400;a4=a4 or 2;local H=Instance.new("ImageLabel")H.Image="rbxassetid://6947150722"H.Position=UDim2.new(0,2,0,a4)H.Parent=S;H.Size=UDim2.new(0,a6,0,50)H.BackgroundTransparency=1;H.BorderSizePixel=0;H.ZIndex=125 end;local function a7(S,a4,a6)a6=a6 or 400;a4=a4 or-50;local H=Instance.new("ImageLabel")H.Image="rbxassetid://6947474904"H.Position=UDim2.new(0,2,1,a4)H.Parent=S;H.Size=UDim2.new(0,a6,0,50)H.BackgroundTransparency=1;H.BorderSizePixel=0;H.ZIndex=125 end;i.SetFont(Enum.Font["Nunito"])i.SetBold(false)i.SetRoundAmount(7)i.SetRoundifyEnabled(true)local a8=math.random(7,10)/10;i.SetTheme({r=a8,g=a8,b=a8+math.random(1,4)/10})local a4=15;local a9="Page_Home"local aa=i.GetScreen()aa.Name="penisjuice-"..g;local ab=i.NewBoard("no",aa,{Position=UDim2.new(0.7,0,1.3,0),Size=UDim2.new(0,500,0,250),Nodrag=true},true)local ac=i.GetParentBoard()i.NewText("Title",ab,{Position=UDim2.new(0,15,0,15),Size=UDim2.new(0,400,0,25),Text="Penoirware GUI <font size='15'>v"..g.."</font>",TextSize=35,TextYAlignment=Enum.TextYAlignment.Center})i.NewBoard("Shadow",ab,{ZIndex=0,Position=UDim2.new(0,3,0,3),Size=UDim2.new(0,500,0,265),BackgroundTransparency=0.3,BackgroundColor3=i.Theme.shadow})i.NewBoard("Roundedbottom1",ab,{Position=UDim2.new(0,0,1,-10),Size=UDim2.new(0,125,0,25),BackgroundColor3=i.Theme.shade4})i.NewBoard("Roundedbottom2",ab,{Position=UDim2.new(0,100,1,-10),Size=UDim2.new(0,25,0,25),BackgroundColor3=i.Theme.shade3,Unroundify=true})i.NewBoard("Roundedbottom3",ab,{Position=UDim2.new(0,115,1,-10),Size=UDim2.new(0,385,0,25),BackgroundColor3=i.Theme.shade3})i.NewBoard("Outline1",ab,{Position=UDim2.new(0,100,0,50),Size=UDim2.new(0,2,0,200),BackgroundColor3=i.Theme.shade6,ZIndex=200})i.NewBoard("Outline2",ab,{Position=UDim2.new(0,0,0,50),Size=UDim2.new(0,500,0,2),BackgroundColor3=i.Theme.shade6,ZIndex=200})local ad=i.NewMenu("Page_Home",ab,{Position=UDim2.new(0,100,0,250),CanvasSize=UDim2.new(0,100,0,100)})local ae=i.NewMenu("Page_Modes",ab,{Position=UDim2.new(0,100,0,250),CanvasSize=UDim2.new(0,100,0,600),Invisible=true})local af=i.NewMenu("Page_Respawn",ab,{Position=UDim2.new(0,100,0,250),CanvasSize=UDim2.new(0,100,0,100),Invisible=true})local ag=i.NewMenu("Page_Info",ab,{Position=UDim2.new(0,100,0,250),CanvasSize=UDim2.new(0,100,0,1255),Invisible=true})local ah=i.NewMenu("Menu_Tabs",ab,{Position=UDim2.new(0,0,0,250),Size=UDim2.new(0,100,0,200),CanvasSize=UDim2.new(0,80,0,100),BackgroundColor3=i.Theme.shade4})i.NewButton("Tab_Home",ah,{Position=UDim2.new(0,12,0,a4),Size=UDim2.new(0,75,0,25),Text="Home"},{on=function()i.OpenObject(i.GetInstance("Tab_Home"))i.CloseObject(i.GetInstance("Tab_Modes"))i.CloseObject(i.GetInstance("Tab_Respawn"))i.CloseObject(i.GetInstance("Tab_Info"))i.GetInstance("Page_Home").Visible=true;i.GetInstance("Page_Modes").Visible=false;i.GetInstance("Page_Respawn").Visible=false;i.GetInstance("Page_Info").Visible=false;a9="Page_Home"end})i.OpenObject(i.GetInstance("Tab_Home"))a4=a4+40;i.NewButton("Tab_Modes",ah,{Position=UDim2.new(0,12,0,a4),Size=UDim2.new(0,75,0,25),Text="Modes"},{on=function()i.CloseObject(i.GetInstance("Tab_Home"))i.OpenObject(i.GetInstance("Tab_Modes"))i.CloseObject(i.GetInstance("Tab_Respawn"))i.CloseObject(i.GetInstance("Tab_Info"))i.GetInstance("Page_Home").Visible=false;i.GetInstance("Page_Modes").Visible=true;i.GetInstance("Page_Respawn").Visible=false;i.GetInstance("Page_Info").Visible=false;a9="Page_Modes"end})a4=a4+40;i.NewButton("Tab_Respawn",ah,{Position=UDim2.new(0,12,0,a4),Size=UDim2.new(0,75,0,25),Text="Respawn"},{on=function()i.CloseObject(i.GetInstance("Tab_Home"))i.CloseObject(i.GetInstance("Tab_Modes"))i.OpenObject(i.GetInstance("Tab_Respawn"))i.CloseObject(i.GetInstance("Tab_Info"))i.GetInstance("Page_Home").Visible=false;i.GetInstance("Page_Modes").Visible=false;i.GetInstance("Page_Respawn").Visible=true;i.GetInstance("Page_Info").Visible=false;a9="Page_Respawn"end})a4=a4+40;i.NewButton("Tab_Info",ah,{Position=UDim2.new(0,12,0,a4),Size=UDim2.new(0,75,0,25),Text="Info"},{on=function()i.CloseObject(i.GetInstance("Tab_Home"))i.CloseObject(i.GetInstance("Tab_Modes"))i.CloseObject(i.GetInstance("Tab_Respawn"))i.OpenObject(i.GetInstance("Tab_Info"))i.GetInstance("Page_Home").Visible=false;i.GetInstance("Page_Modes").Visible=false;i.GetInstance("Page_Respawn").Visible=false;i.GetInstance("Page_Info").Visible=true;a9="Page_Info"end})i.NewButton("MinimizeButton",ab,{Position=UDim2.new(1,-60,0,5),Size=UDim2.new(0,25,0,25),BackgroundColor3=i.Theme.shade7,Text="-",TextSize=14},{on=function()i.GetInstance("MinimizeButton").Text="+"i.TweenSize(ac,UDim2.new(0,ac.Size.X.Offset,0,50),0.75,Enum.EasingDirection.Out)i.TweenSize(i.GetInstance("Shadow"),UDim2.new(0,ac.Size.X.Offset,0,50),0.75,Enum.EasingDirection.Out)local function ai(x)i.Async(function()i.TweenSize(x,UDim2.new(x.Size.X.Scale,x.Size.X.Offset,x.Size.Y.Scale,0),0.75,Enum.EasingDirection.Out)wait(0.75)if x.Size.Y.Offset==0 then x.Visible=false end end)end;ai(i.GetInstance("Page_Home"))ai(i.GetInstance("Page_Info"))ai(i.GetInstance("Page_Modes"))ai(i.GetInstance("Page_Respawn"))ai(i.GetInstance("Menu_Tabs"))ai(i.GetInstance("Outline1"))ai(i.GetInstance("Outline2"))ai(i.GetInstance("Roundedbottom3"))ai(i.GetInstance("Roundedbottom2"))ai(i.GetInstance("Roundedbottom1"))end,off=function()i.GetInstance("MinimizeButton").Text="-"local function aj(x,a4)i.Async(function()x.Visible=true;i.TweenSize(x,UDim2.new(x.Size.X.Scale,x.Size.X.Offset,x.Size.Y.Scale,a4),0.75,Enum.EasingDirection.Out)end)end;i.TweenSize(ac,UDim2.new(0,ac.Size.X.Offset,0,250),0.75,Enum.EasingDirection.Out)i.TweenSize(i.GetInstance("Shadow"),UDim2.new(0,ac.Size.X.Offset,0,265),0.75,Enum.EasingDirection.Out)aj(i.GetInstance("Page_Home"),200)aj(i.GetInstance("Page_Info"),200)aj(i.GetInstance("Page_Modes"),200)aj(i.GetInstance("Page_Respawn"),200)aj(i.GetInstance("Menu_Tabs"),200)i.GetInstance("Page_Home").Visible=false;i.GetInstance("Page_Info").Visible=false;i.GetInstance("Page_Modes").Visible=false;i.GetInstance("Page_Respawn").Visible=false;i.GetInstance(a9).Visible=true;aj(i.GetInstance("Outline1"),200)aj(i.GetInstance("Outline2"),2)aj(i.GetInstance("Roundedbottom1"),25)aj(i.GetInstance("Roundedbottom2"),25)aj(i.GetInstance("Roundedbottom3"),25)end})i.NewButton("CloseButton",ab,{Position=UDim2.new(1,-30,0,5),Size=UDim2.new(0,25,0,25),BackgroundColor3=i.Theme.shade7,Text="X",TextSize=14},{on=function()i.TweenPosition(ac,UDim2.new(ac.Position.X.Scale,ac.Position.X.Offset,1.1,0),0.75,Enum.EasingDirection.In)i.TweenCustom(ac,{Size=UDim2.new(0,ac.Size.X.Offset,0,0)},0.75,Enum.EasingDirection.In)wait(0.25)i.FadeOut(ac,1)wait(0.5)aa:Destroy()netbypass_disable()for B,C in pairs(v)do v[B]=nil;pcall(function()C:Destroy()end)end;pcall(function()mouse_part:Destroy()end)I()pcall(function()plhk_connection:Disconnect()end)pcall(function()f:UnbindAction("PLHKRESP")end)pcall(function()r:Destroy()end)pcall(function()s:Destroy()end)pcall(function()t:Destroy()end)pcall(function()u:Destroy()end)end})a5(i.GetInstance("Page_Home"))a7(i.GetInstance("Page_Home"))a5(i.GetInstance("Page_Info"))a7(i.GetInstance("Page_Info"))a5(i.GetInstance("Page_Modes"))a7(i.GetInstance("Page_Modes"))a5(i.GetInstance("Page_Respawn"))a7(i.GetInstance("Page_Respawn"))a4=5;i.NewText("Page_Home_Title",ad,{Position=UDim2.new(0.05,-10,0,a4),Size=UDim2.new(0,400,0,25),Text="Home",TextSize=20})a1(i.GetInstance("Page_Home_Title"))a4=a4+30;i.NewText("1_Text",ad,{Position=UDim2.new(0,10,0,30),Size=UDim2.new(0,400,0,75),Text=" Penoirware made by topit<br/>Check out what the new features are in the <b>info</b> tab<br/><br/>Join the discord: <br/><br/><br/><br/>Version "..g,TextSize=20})a3(ad,165)i.NewButton("HomeDiscord",ad,{Position=UDim2.new(0.075,0,0,120),Size=UDim2.new(0,340,0,25),Text="Copy invite to clipboard"},{on=function()setclipboard("https://discord.gg/Gn9vWr8DJC")i.Async(function()i.GetInstance("HomeDiscord").Text="Copied"wait(1)i.GetInstance("HomeDiscord").Text="Copy invite to clipboard"end)end})a4=5;i.NewText("Page_Modes_Title2",ae,{Position=UDim2.new(0.05,-10,0,a4),Size=UDim2.new(0,400,0,25),Text="Penoir modes",TextSize=20})a1(i.GetInstance("Page_Modes_Title2"))a4=a4+30;i.NewButton("Penoir_Normal",ae,{Position=UDim2.new(0.075,0,0,a4),Size=UDim2.new(0,340,0,25),Text="Normal penoir"},{on=function()local ak=GetCharacter()if ak then for al,am in pairs(ak:GetChildren())do if am:IsA("Accessory")then if am.Name:match("Fedora")or am.Name=="MeshPartAccessory"then table.insert(v,am)end end end;for al,an in pairs(v)do pcall(function()GetMesh(an.Handle):Destroy()end)end;r=Instance.new("Folder")r.Name="PenoirParts1"r.Parent=workspace;for al,an in pairs(v)do for al,am in pairs(an["Handle"]:GetChildren())do if am:IsA("Weld")then am:Destroy()end end;an.Parent=r end;for ao,an in pairs(v)do if not pcall(function()return an["Handle"]["Sussy baka"].Name end)then local ap=Instance.new("BodyVelocity")ap.Velocity=Vector3.new(0,0,0)ap.Parent=an["Handle"]ap.Name="Sussy baka"end end;m["Penoir_Normal"]=l.Heartbeat:Connect(function()for aq,an in pairs(v)do if aq>2 then pcall(function()an["Handle"].CFrame=ak["HumanoidRootPart"].CFrame*CFrame.new(0,-0.8,-aq/2*q+1.21)end)else pcall(function()an["Handle"].CFrame=ak["HumanoidRootPart"].CFrame*CFrame.new((aq-1.5)*1.35,-0.8,-0.8)end)end;an["Handle"].Velocity=Vector3.new(0,0,0)end end)end end,off=function()for B,C in pairs(v)do v[B]=nil;C:Destroy()end;r:Destroy()netbypass_disable()end})a4=a4+30;i.NewButton("Penoir_Swing",ae,{Position=UDim2.new(0.075,0,0,a4),Size=UDim2.new(0,340,0,25),Text="Swinging penoir"},{on=function()local ak=GetCharacter()if ak then for al,am in pairs(ak:GetChildren())do if am:IsA("Accessory")then if am.Name:match("Fedora")or am.Name=="MeshPartAccessory"then table.insert(v,am)end end end;for al,an in pairs(v)do pcall(function()GetMesh(an.Handle):Destroy()end)end;s=Instance.new("Folder")s.Name="PenoirParts2"s.Parent=workspace;for al,an in pairs(v)do for al,am in pairs(an["Handle"]:GetChildren())do if am:IsA("Weld")then am:Destroy()end end;an.Parent=s end;for ao,an in pairs(v)do if not pcall(function()return an["Handle"]["Sussy baka"].Name end)then local ap=Instance.new("BodyPosition")ap.Parent=an["Handle"]ap.Name="Sussy baka"ap.D=4+p*40-ao/5;ap.P=1500;local E=Instance.new("BodyGyro")E.Parent=an["Handle"]E.Name="Imposter"E.D=10;E.P=1500;E.MaxTorque=Vector3.new(9e9,9e9,9e9)end end;if n then m["Penoir_Swing"]=l.Heartbeat:Connect(function()for aq,an in pairs(v)do if aq>2 then pcall(function()an["Handle"]["Sussy baka"].Position=(ak["HumanoidRootPart"].CFrame*CFrame.new(0,-0.8,-(aq-2)/2*q)).Position;an["Handle"]["Sussy baka"].D=4+p*2-aq/5;an["Handle"]["Imposter"].CFrame=CFrame.new(ak["HumanoidRootPart"].Position,ak["HumanoidRootPart"].Position+ak["HumanoidRootPart"].CFrame.LookVector)end)else pcall(function()an["Handle"]["Sussy baka"].Position=(ak["HumanoidRootPart"].CFrame*CFrame.new((aq-1.5)*1.35,-0.8,-0.8)).Position;an["Handle"]["Sussy baka"].D=4+p*2-aq/5;an["Handle"]["Imposter"].CFrame=CFrame.new(ak["HumanoidRootPart"].Position,ak["HumanoidRootPart"].Position+ak["HumanoidRootPart"].CFrame.LookVector)end)end;an["Handle"].Velocity=Vector3.new(0,0,0)end end)else m["Penoir_Swing"]=l.Heartbeat:Connect(function()for aq,an in pairs(v)do pcall(function()an["Handle"]["Sussy baka"].Position=(ak["HumanoidRootPart"].CFrame*CFrame.new(0,-0.8,-aq/2*q)).Position;an["Handle"]["Sussy baka"].D=4+p*2-aq/5;an["Handle"]["Imposter"].CFrame=CFrame.new(ak["HumanoidRootPart"].Position,ak["HumanoidRootPart"].Position+ak["HumanoidRootPart"].CFrame.LookVector)end)an["Handle"].Velocity=Vector3.new(0,0,0)end end)end end end,off=function()for B,C in pairs(v)do v[B]=nil;C:Destroy()end;s:Destroy()netbypass_disable()end})a4=a4+30;i.NewButton("Penoir_Mouse",ae,{Position=UDim2.new(0.075,0,0,a4),Size=UDim2.new(0,340,0,25),Text="Mouse-facing penoir"},{on=function()local ak=GetCharacter()if ak then ak=GetCharacter()local ar=j:GetMouse()mouse_part=Instance.new("Part")mouse_part.CFrame=CFrame.new(ak.HumanoidRootPart.Position,ar.Hit.Position)mouse_part.Transparency=1;mouse_part.Anchored=true;mouse_part.CanCollide=false;mouse_part.Name="imposterbaka"mouse_part.Size=Vector3.new(1,1,1)mouse_part.Parent=workspace;for al,am in pairs(ak:GetChildren())do if am:IsA("Accessory")then if am.Name:match("Fedora")or am.Name=="MeshPartAccessory"then table.insert(v,am)end end end;for al,an in pairs(v)do pcall(function()GetMesh(an.Handle):Destroy()end)end;t=Instance.new("Folder")t.Name="PenoirParts3"t.Parent=workspace;ar.TargetFilter=t;for al,an in pairs(v)do for al,am in pairs(an["Handle"]:GetChildren())do if am:IsA("Weld")then am:Destroy()end end;an.Parent=t end;for ao,an in pairs(v)do if not pcall(function()return an["Handle"]["Sussy baka"].Name end)then local ap=Instance.new("BodyPosition")ap.Parent=an["Handle"]ap.Name="Sussy baka"ap.D=4+p*40-ao/5;ap.P=1500;local E=Instance.new("BodyGyro")E.Parent=an["Handle"]E.Name="Imposter"E.D=10;E.P=1500;E.MaxTorque=Vector3.new(9e9,9e9,9e9)end end;if n then m["Penoir_Mouse"]=l.Heartbeat:Connect(function()mouse_part.CFrame=CFrame.new(j.Character.HumanoidRootPart.Position-Vector3.new(0,0.8,0),ar.Hit.Position)for aq,an in pairs(v)do if aq>2 then pcall(function()an["Handle"]["Sussy baka"].Position=(mouse_part.CFrame+mouse_part.CFrame.LookVector*(aq-2)/2*q).Position;an["Handle"]["Sussy baka"].D=4+p*2-aq/5;an["Handle"]["Imposter"].CFrame=CFrame.new(mouse_part.Position,mouse_part.Position+mouse_part.CFrame.LookVector)end)else do pcall(function()an["Handle"]["Sussy baka"].Position=(mouse_part.CFrame*CFrame.new((aq-1.5)*1.35,0,-0.5)).Position;an["Handle"]["Sussy baka"].D=4+p*2-aq/5;an["Handle"]["Imposter"].CFrame=CFrame.new(mouse_part.Position,mouse_part.Position+mouse_part.CFrame.LookVector)end)end end;an["Handle"].Velocity=Vector3.new(0,0,0)end end)else m["Penoir_Mouse"]=l.Heartbeat:Connect(function()mouse_part.CFrame=CFrame.new(ak.HumanoidRootPart.Position-Vector3.new(0,0.8,0),ar.Hit.Position)for aq,an in pairs(v)do pcall(function()an["Handle"]["Sussy baka"].Position=(mouse_part.CFrame+mouse_part.CFrame.LookVector*aq/2*q).Position;an["Handle"]["Sussy baka"].D=4+p*2-aq/5;an["Handle"]["Imposter"].CFrame=CFrame.new(mouse_part.Position,mouse_part.Position+mouse_part.CFrame.LookVector)end)an["Handle"].Velocity=Vector3.new(0,0,0)end end)end;if o then e:BindToRenderStep("PlayerRotatePenoir",800,function()pcall(function()j.Character.Humanoid.AutoRotate=false;j.Character.HumanoidRootPart.CFrame=CFrame.new(j.Character.HumanoidRootPart.CFrame.Position,j.Character.HumanoidRootPart.CFrame.Position+Vector3.new(mouse_part.CFrame.LookVector.X,0,mouse_part.CFrame.LookVector.Z))end)end)end end end,off=function()for B,C in pairs(v)do v[B]=nil;C:Destroy()end;pcall(function()mouse_part:Destroy()end)pcall(function()t:Destroy()end)I()netbypass_disable()end})a4=a4+30;i.NewButton("Penoir_FacePlr",ae,{Position=UDim2.new(0.075,0,0,a4),Size=UDim2.new(0,340,0,25),Text="Face nearest player penoir"},{on=function()if#game.Players:GetPlayers()==1 then w("Not enough players")i.SetInstanceValue("Penoir_FacePlr",false)i.CloseObject(i.GetInstance("Penoir_FacePlr"))return end;local ak=GetCharacter()if ak then mouse_part=Instance.new("Part")mouse_part.CFrame=CFrame.new(ak.HumanoidRootPart.Position,Vector3.new(0,0,0))mouse_part.Transparency=1;mouse_part.Anchored=true;mouse_part.CanCollide=false;mouse_part.Parent=game.Workspace;mouse_part.Name="imposterbaka"mouse_part.Size=Vector3.new(1,1,1)for al,am in pairs(ak:GetChildren())do if am:IsA("Accessory")then if am.Name:match("Fedora")or am.Name=="MeshPartAccessory"then table.insert(v,am)end end end;for al,an in pairs(v)do pcall(function()GetMesh(an.Handle):Destroy()end)end;u=Instance.new("Folder")u.Name="PenoirParts4"u.Parent=workspace;for al,an in pairs(v)do for al,am in pairs(an["Handle"]:GetChildren())do if am:IsA("Weld")then am:Destroy()end end;an.Parent=u end;for ao,an in pairs(v)do if not pcall(function()return an["Handle"]["Sussy baka"].Name end)then local ap=Instance.new("BodyPosition")ap.Parent=an["Handle"]ap.Name="Sussy baka"ap.D=4+p*40-ao/5;ap.P=1500;local E=Instance.new("BodyGyro")E.Parent=an["Handle"]E.Name="Imposter"E.D=10;E.P=1500;E.MaxTorque=Vector3.new(9e9,9e9,9e9)end end;if n then m["Penoir_FacePlr"]=l.Heartbeat:Connect(function()local as=D().Character.HumanoidRootPart.Position;mouse_part.CFrame=CFrame.new(ak.HumanoidRootPart.Position-Vector3.new(0,0.8,0),as-Vector3.new(0,0.8,0))for aq,an in pairs(v)do if aq>2 then pcall(function()an["Handle"]["Sussy baka"].Position=(mouse_part.CFrame+mouse_part.CFrame.LookVector*(aq-2)/2*q).Position;an["Handle"]["Sussy baka"].D=4+p*2-aq/5;an["Handle"]["Imposter"].CFrame=CFrame.new(mouse_part.Position,mouse_part.Position+mouse_part.CFrame.LookVector)end)else do pcall(function()an["Handle"]["Sussy baka"].Position=(mouse_part.CFrame*CFrame.new((aq-1.5)*1.35,0,-0.5)).Position;an["Handle"]["Sussy baka"].D=4+p*2-aq/5;an["Handle"]["Imposter"].CFrame=CFrame.new(mouse_part.Position,mouse_part.Position+mouse_part.CFrame.LookVector)end)end end;an["Handle"].Velocity=Vector3.new(0,0,0)end end)else m["Penoir_FacePlr"]=l.Heartbeat:Connect(function()local as=D().Character.HumanoidRootPart.Position;mouse_part.CFrame=CFrame.new(ak.HumanoidRootPart.Position-Vector3.new(0,0.8,0),as-Vector3.new(0,0.8,0))for aq,an in pairs(v)do pcall(function()an["Handle"]["Sussy baka"].Position=(mouse_part.CFrame+mouse_part.CFrame.LookVector*aq/2*q).Position;an["Handle"]["Sussy baka"].D=4+p*2-aq/5;an["Handle"]["Imposter"].CFrame=CFrame.new(mouse_part.Position,mouse_part.Position+mouse_part.CFrame.LookVector)an["Handle"].Velocity=Vector3.new(0,0,0)end)end end)end;if o then e:BindToRenderStep("PlayerRotatePenoir",800,function()pcall(function()j.Character.Humanoid.AutoRotate=false;j.Character.HumanoidRootPart.CFrame=CFrame.new(j.Character.HumanoidRootPart.CFrame.Position,j.Character.HumanoidRootPart.CFrame.Position+Vector3.new(mouse_part.CFrame.LookVector.X,0,mouse_part.CFrame.LookVector.Z))end)end)end end end,off=function()for B,C in pairs(v)do v[B]=nil;C:Destroy()end;pcall(function()mouse_part:Destroy()end)pcall(function()u:Destroy()end)I()netbypass_disable()end})a4=a4+30;i.NewText("Penoir_SizeText",ae,{Position=UDim2.new(0.075,0,0,a4),Size=UDim2.new(0,220,0,25),Text="Pen. length: "..q})i.NewBoard("Penoir_SizeAmount",ae,{ClipsDescendants=true,Position=UDim2.new(0.375,0,0,a4+9),Size=UDim2.new(0,220,0,7),ZIndex=200})local at=Instance.new("Frame")at.BackgroundColor3=Color3.fromRGB(255,255,255)at.Size=UDim2.new(0,7,0,7)at.Position=UDim2.new(0,106.5,0,0)at.Parent=i.GetInstance("Penoir_SizeAmount")at.BorderSizePixel=0;at.ZIndex=500;i.Roundify(at)local au={}i.MakeSlider(at,i.GetInstance("Penoir_SizeAmount"),au,function()q=1+au[3]/213;i.GetInstance("Penoir_SizeText").Text="Pen. length: "..tostring(q):sub(1,3)end,true)a4=a4+30;i.NewText("Swing_AmountText",ae,{Position=UDim2.new(0.075,0,0,a4),Size=UDim2.new(0,220,0,25),Text="Pen. swing: "..tostring(p)})i.NewBoard("Swing_Amount",ae,{ClipsDescendants=true,Position=UDim2.new(0.375,0,0,a4+9),Size=UDim2.new(0,220,0,7),ZIndex=200})local at=Instance.new("Frame")at.BackgroundColor3=Color3.fromRGB(255,255,255)at.Size=UDim2.new(0,7,0,7)at.Position=UDim2.new(0,106.5,0,0)at.Parent=i.GetInstance("Swing_Amount")at.BorderSizePixel=0;at.ZIndex=500;i.Roundify(at)local av={}i.MakeSlider(at,i.GetInstance("Swing_Amount"),av,function()p=1+av[3]/213;i.GetInstance("Swing_AmountText").Text="Pen. swing: "..tostring(p):sub(1,3)end,true)a4=a4+30;i.NewButton("Penoir_Balls",ae,{Position=UDim2.new(0.075,0,0,a4),Size=UDim2.new(0,340,0,25),Text="Balls on non-normal modes"},{on=function()n=true;w("Pee is stored in the balls")end,off=function()n=false;w("Pee isn&apos;t stored in the balls")end})i.OpenObject(i.GetInstance("Penoir_Balls"))i.SetInstanceValue("Penoir_Balls",true)n=true;a4=a4+30;i.NewButton("Player_Rotate",ae,{Position=UDim2.new(0.075,0,0,a4),Size=UDim2.new(0,340,0,25),Text="Face toward mouse / nearest player"},{on=function()o=true;w("Player rotate enabled")end,off=function()o=false;w("Player rotate disabled")I()end})a4=5;i.NewText("Page_Respawn_Title",af,{Position=UDim2.new(0.05,-10,0,a4),Size=UDim2.new(0,400,0,25),Text="Respawn",TextSize=20})a1(i.GetInstance("Page_Respawn_Title"))a4=a4+30;i.NewButton("Respawn_Normal",af,{Position=UDim2.new(0.075,0,0,a4),Size=UDim2.new(0,340,0,25),Text="Normal respawn"},{on=function()w("Respawning...")local ak=GetCharacter()if ak then local aw=o;I()local ax=ak["HumanoidRootPart"].CFrame;ak["Humanoid"].Health=0;wait(0.1)sussy_respawn_connec=j.CharacterAdded:Connect(function()wait(0.2)GetCharacter().HumanoidRootPart.CFrame=ax;sussy_respawn_connec:Disconnect()if aw then I()i.OpenObject(i.GetInstance("Player_Rotate"))i.SetInstanceValue("Player_Rotate",true)o=true end end)end end})a4=a4+30;i.NewButton("Respawn_Inf",af,{Position=UDim2.new(0.075,0,0,a4),Size=UDim2.new(0,340,0,25),Text="Infinite yield&apos;s respawn"},{on=function()w("Respawning (IY)...")local ak=GetCharacter()if ak then local aw=o;local ax=ak["HumanoidRootPart"].CFrame;ak["Humanoid"]:ChangeState(15)ak:ClearAllChildren()local ay=Instance.new("Model")ay.Parent=workspace;j.Character=ay;wait()j.Character=ak;ay:Destroy()wait(0.1)sussy_respawn_connec=j.CharacterAdded:Connect(function()wait(0.2)GetCharacter().HumanoidRootPart.CFrame=ax;sussy_respawn_connec:Disconnect()if aw then I()i.OpenObject(i.GetInstance("Player_Rotate"))i.SetInstanceValue("Player_Rotate",true)o=true end end)end end})if game.PlaceId==155615604 then a4=a4+30;i.NewText("Page_Respawn_PLTitle",af,{Position=UDim2.new(0.05,-10,0,a4),Size=UDim2.new(0,400,0,25),Text="Prison life",TextSize=20})a1(i.GetInstance("Page_Respawn_PLTitle"))local az=game.Workspace.Remote["loadchar"]local aA=nil;local aB=nil;local function aC()w("Respawning (Instant)...")local ak=GetCharacter()if ak then local aD=0;netbypass_disable()local ax=ak["HumanoidRootPart"].CFrame;az:InvokeServer(j)wait(0.1)GetCharacter()["HumanoidRootPart"].CFrame=ax;I()for B,C in pairs(v)do v[B]=nil;C:Destroy()end;pcall(function()mouse_part:Destroy()end)pcall(function()penoir_parts:Destroy()end)i.SetInstanceValue("Penoir_Normal",false)i.CloseObject(i.GetInstance("Penoir_Normal"))i.SetInstanceValue("Penoir_Swing",false)i.CloseObject(i.GetInstance("Penoir_Swing"))i.SetInstanceValue("Penoir_Mouse",false)i.CloseObject(i.GetInstance("Penoir_Mouse"))i.SetInstanceValue("Penoir_FacePlr",false)i.CloseObject(i.GetInstance("Penoir_FacePlr"))end end;a4=a4+30;i.NewButton("Respawn_PL",af,{Position=UDim2.new(0.075,0,0,a4),Size=UDim2.new(0,340,0,25),Text="Prison life insta respawn"},{on=function()aC()end})a4=a4+30;i.NewButton("Respawn_PLHK",af,{Position=UDim2.new(0.075,0,0,a4),Size=UDim2.new(0,340,0,25),Text="PL Respawn hotkey: none"},{on=function()i.GetInstance("Respawn_PLHK").Text="Enter a hotkey."i.Async(function()while i.GetInstance("Respawn_PLHK").Text:sub(1,5)=="Enter"do if i.GetInstance("Respawn_PLHK").Text:sub(1,5)=="Enter"then i.GetInstance("Respawn_PLHK").Text="Enter a hotkey.."end;wait(0.3)if i.GetInstance("Respawn_PLHK").Text:sub(1,5)=="Enter"then i.GetInstance("Respawn_PLHK").Text="Enter a hotkey..."end;wait(0.3)if i.GetInstance("Respawn_PLHK").Text:sub(1,5)=="Enter"then i.GetInstance("Respawn_PLHK").Text="Enter a hotkey."end;wait(0.3)end end)plhk_connection=d.InputBegan:Connect(function(aE,aF)local P=aE.KeyCode;if P.Name~="Unknown"then i.GetInstance("Respawn_PLHK").Text="PL Respawn hotkey: "..P.Name;aA=P;plhk_connection:Disconnect()f:BindAction("PLHKRESP",function(al,aG,aE)if aG==Enum.UserInputState.Begin then aC()end end,false,aA)elseif P.Name=="Unknown"then i.GetInstance("Respawn_PLHK").Text="PL Respawn hotkey: none"aA=nil;plhk_connection:Disconnect()f:UnbindAction("PLHKRESP")end end)end})end;a4=5;i.NewText("InfoText1",ag,{Position=UDim2.new(0.05,-10,0,a4),Size=UDim2.new(0,400,0,25),Text="Information",TextSize=20})a1(i.GetInstance("InfoText1"))i.NewText("InfoText2",ag,{Position=UDim2.new(0,10,0,30),Size=UDim2.new(0,400,0,2345),Text=" ".."<font size='24'><i>Required hats</i></font>".."<br/>For this script to work, you must have <b>9</b> different<br/>international fedoras. They&apos;re free, so no worries.<br/>If you don&apos;t know how to get them, scroll down to Q/A.".."<br/><br/>".."<font size='24'><i>Version 1.2.0</i></font>".."<br/> -Switched to netless; more exploits are compatible now".."<br/> -Changed how swing works".."<br/> -Made it less detectable in certain games".."<br/> -Defaulted balls to on".."<br/> -Updated discord link".."<br/><br/>".."<font size='24'><i>Version 1.1.0</i></font>".."<br/> -Possibly improved net bypass".."<br/> -Made IY respawn mode better".."<br/> -Added balls option and look at mouse / other player<br/>option".."<br/> -Changed how penoir swing was calculated".."<br/> -Made non-normal penoir modes look better".."<br/> -Made mouse mode not glitch out when you looked<br/>at the penoir".."<br/><br/>".."<font size='24'><i>Version 1.0.0</i></font>".."<br/> -Added normal penoir, mouse facing penoir,<br/>swinging penoir, and player facing penoir.".."<br/> -Added IY respawn and Normal respawn modes".."<br/> -Added Penoir Swing setting and Penoir Length setting".."<br/> -Added special support for the game Prison Life".."<br/><br/>".."<font size='24'><i>Help / Q&A</i></font>".."<br/><b>It doesn&apos;t work in <i>x</i> game!</b><br/>You can send me the game link, but odds are I won&apos;t update<br/>this script ever again".."<br/><b>Can I enable multiple penoir modes?</b><br/>No, this will break the script.".."<br/><br/><b>What does the Penoir Swing setting do?</b><br/>The higher the number, the less it swings.<br/>The name should be &quot;Swing Dampening&quot;, but I don&apos;t care.".."<br/><br/><b>Why doesn&apos;t the netless work?</b><br/> - If someone touches the blocks, you lose<br/>network ownership and they break. There&apos;s<br/>no way to get around this.".."<br/><br/><b>How do I equip multiple fedoras?</b><br/>Go to Avatar -> Clothing -> Hat, and scroll to the bottom.<br/>Click &quot;advanced&quot;, and paste in all of your hat IDs.<br/>Note that all fedoras should be supported, but some<br/>may not work because of their model name.".."<br/><br/><b>Can I close the GUI with some modules on?</b><br/>Although it should be fine, I wouldn&apos;t recommend it.".."<br/><br/><b>Does this support <i>x</i> exploit?</b><br/>Penoirware is tested on synapse, but should work fine on<br/>any exploit that can run PSU.<br/>Because of the switch to netless, more exploits<br/>are supported.",TextSize=18})local aH=Instance.new("Frame")aH.Size=UDim2.new(0,500,0,50)aH.Position=UDim2.new(0,0,0,0)aH.Parent=ac;aH.BackgroundTransparency=1;aH.BorderSizePixel=0;local Y={}aH.InputBegan:Connect(function(aI)if aI.UserInputType==Enum.UserInputType.MouseButton1 then Y[1]=true;Y[2]=ac.Position;tdc3=game:GetService("UserInputService").InputChanged:Connect(function(aJ)if aJ.UserInputType==Enum.UserInputType.MouseMovement then local aK=aJ.Position-aI.Position;i.TweenPosition(ac,UDim2.new(Y[2].X.Scale,Y[2].X.Offset+aK.X,Y[2].Y.Scale,Y[2].Y.Offset+aK.Y),0.75)end end)end end)aH.InputEnded:Connect(function(aI)if aI.UserInputType==Enum.UserInputType.MouseButton1 then Y[1]=false;tdc3:Disconnect()end end)m["ONHUMDEATH"]=j.CharacterRemoving:Connect(function()netbypass_disable()end)settings().Physics.AllowSleep=false;settings().Physics.DisableCSGv2=true;settings().Physics.PhysicsEnvironmentalThrottle=Enum.EnviromentalPhysicsThrottle.Disabled;i.Ready()i.SendMessage({Horizontal=true,Text="<font size='30'>Loaded <b>Penoirware</b>.<br/>Required hats are listed in <b>Info</b></font>",Size=UDim2.new(0,500,0,75),Position=UDim2.new(0.05,0,0.9,0),Delay=3})