--Darkenmoor gui
--Made by topit

local a=game:GetService("Players")local b=game:GetService("ReplicatedStorage")local c=a.LocalPlayer;local d=CFrame.new;local e=Vector3.new;local f=Vector2.new;local g=Color3.new;local h=task.wait;local i=task.delay;local j=task.spawn;local k=table.insert;local l=table.remove;local m=math.random;local n=Instance.new("Part")n.Anchored=true;n.CanCollide=false;n.Transparency=1;n.Name="gj138$Ga9g13g59m$g231"n.Parent=workspace;local function o()n.Position=c.Character.HumanoidRootPart.Position+e(0,1.4,0)workspace.CurrentCamera.CameraSubject=n end;local function p()workspace.CurrentCamera.CameraSubject=c.Character.Humanoid end;local function q(r,s)local t,u=pcall(function()return r[s]end)return t and u or nil end;local v=loadstring(game:HttpGet('https://raw.githubusercontent.com/topitbopit/rblx/main/ui-stuff/jeff_2.lua'))()if game.PlaceId~=461482416 then v:NewNotification("Wrong game","Wrong game",5)return end;v:SetColors("red")local w=v:NewWindow("Darkenmoor GUI",400,300)local x=w:NewMenu("Misc")local y=w:NewMenu("Modifiers")local z=w:NewMenu("Item spawner")x:NewSection("ESP")local A=x:NewToggle("Enable player ESP")local B=x:NewToggle("Enable item ESP")if type(Drawing)~="table"then A:Hide("Your exploit doesn't support the Drawing library")B:Hide("Your exploit doesn't support the Drawing library")end;local C=x:NewDropdown("ESP Type",{"Drawing"})x:NewLabel("More esp types coming soon")x:NewSection("Cogs")local D=x:NewButton("Give cogs")local E=x:NewToggle("Loop give cogs")x:NewSection("Visiblity")local F=x:NewToggle("Unlock camera")local G=x:NewButton("Show mouse")x:NewSection("Server fucker")local H=x:NewButton("Kill monsters (gun mode)")local I=x:NewButton("Kill the monster")local J=x:NewButton("Kill humans")local K=x:NewButton("Kill all")x:NewLabel("Smite")local L=x:NewButton("Smite monsters (gun mode)")local M=x:NewButton("Smite the monster")local N=x:NewButton("Smite humans")local O=x:NewButton("Smite all")K:Hide("Waiting for a game to start...")J:Hide("Waiting for a game to start...")I:Hide("Waiting for a game to start...")O:Hide("Waiting for a game to start...")N:Hide("Waiting for a game to start...")M:Hide("Waiting for a game to start...")x:NewSection("Collect items")local P=x:NewToggle("Loop collect candy")local Q=x:NewButton("Collect candy")local R=x:NewButton("Collect clocks")P:Assert("firetouchinterest")Q:Assert("firetouchinterest")R:Assert("firetouchinterest")x:NewSection("Credit")x:NewLabel("Made by topit")local S=x:NewButton("Join the discord")x:NewLabel("")x:NewLabel("-----------------------------------------------------")x:NewLabel("v1.0.1 - ui version "..(v.Version or v.version))x:NewLabel("")y:NewSection("Monster")local T=y:NewSlider("Damage",0,300,25)local U=y:NewSlider("Attack delay",0,50,15)y:NewSection("Human")local V=y:NewToggle("Infinite mana")y:NewSection("Generic")local W=y:NewToggle("Infinite stamina")z:NewLabel("Coming soon!")local X={}local Y={}local Z={}local _={}local a0=b.Remotes.Events["Damage2.0"]local a1=b.Remotes.Events.ProjectileHit;local a2=b.Bindables.Events.Replicate;local a3=b.Remotes.Events.Replicate;local a4={Game_Clock={t="clock",c=Color3.new(0.2,0.7,1)},Peel={t="banana",c=Color3.new(1,1,0.1)},Collectable_ChocolateBar={t="candy",c=Color3.new(0.3,1,0.3)},Collectable_Round={t="candy",c=Color3.new(0.3,1,0.3)},Collectable_Tootsie={t="candy",c=Color3.new(0.3,1,0.3)},Collectable_Ammo={t="candy",c=Color3.new(0.3,1,0.3)},Collectable_CandyApple={t="candy",c=Color3.new(0.3,1,0.3)}}local a5;C.OnSelection:Connect(function(a6,a7)if a7==1 then if type(Drawing)~="table"then A:Hide("Your exploit doesn't support the Drawing library")B:Hide("Your exploit doesn't support the Drawing library")end else if A.Hidden==true then A:Unhide()B:Unhide()end end end)A.OnEnable:Connect(function()local a8=C:GetSelection()if a8=="Drawing"then j(function()local a9=g(0.9,0.9,0.9)for aa,ab in pairs(a:GetPlayers())do local t=Drawing.new("Text")t.Visible=true;t.Color=a9;t.Text=ab.Name;t.Outline=true;t.OutlineColor=g(0.1,0.1,0.11)t.Font=Drawing.Fonts.Plex;X[ab.Name]=t end;_["NewPlayer"]=a.PlayerAdded:Connect(function(ab)local t=Drawing.new("Text")t.Visible=true;t.Color=a9;t.Text=ab.Name;t.Outline=true;t.OutlineColor=g(0.1,0.1,0.11)t.Font=Drawing.Fonts.Plex;X[ab.Name]=t end)local ac=workspace.CurrentCamera;local ad=Drawing.new("Text")ad.Visible=true;ad.Outline=true;ad.OutlineColor=g(0.1,0.1,0.11)ad.Font=Drawing.Fonts.Plex;ad.Color=Color3.new(0.9,0.3,0.9)ad.Position=Vector2.new(15,885)local ae=0;while A:GetState()do ad.Text="Player ESP objects: "..tostring(ae)ae=0;for aa,ab in pairs(X)do ae=ae+1;local af=pcall(function()local ag=a[aa]local ah=ag.Character;local ai,aj=ac:WorldToViewportPoint(ah.HumanoidRootPart.Position+e(0,4,0))ab.Visible=aj;ab.Color=ag.TeamColor and ag.TeamColor.Color or a9;ab.Position=f(ai.X-ab.TextBounds.X*0.5,ai.Y)end)if not af then if not q(a,aa)then ab.Position=f(150,500)ab:Remove()X[aa]=nil end end end;h()end;ad:Remove()end)elseif a8=="Billboard"then elseif a8=="Highlight"then end end)A.OnDisable:Connect(function()for aa,ab in pairs(X)do ab:Remove()end;X={}_["NewPlayer"]:Disconnect()end)B.OnEnable:Connect(function()local a8=C:GetSelection()if a8=="Drawing"then j(function()local ak=q(workspace,"Map")local al=q(workspace,"DropFolders")_["MapCheck1"]=workspace.ChildAdded:Connect(function(ah)if ah.Name=="Map"and ah:IsA("Folder")then ak=ah end end)_["MapCheck2"]=workspace.ChildRemoved:Connect(function(ah)if ah.Name=="Map"and ah:IsA("Folder")then for aa,am in pairs(Z)do am['t']:Remove()Z[aa]=nil end end end)while not ak do local ah=workspace.ChildAdded:Wait()if ah.Name=="Map"then ak=ah elseif ah.Name=="DropFolders"then al=ah end end;if B:GetState()==false then return end;if q(ak,"Game_Items")then _["ItemCheck1"]=ak["Game_Items"].ChildAdded:Connect(function(ah)local z=a4[ah.Name]local t=Drawing.new("Text")t.Visible=true;t.Outline=true;t.OutlineColor=g(0.1,0.1,0.11)t.Font=Drawing.Fonts.Plex;if z then t.Color=z.c;t.Text=z.t elseif ah.Name:match("eport")then t.Color=Color3.new(0.8,0.8,0.1)t.Text="teleporter"else t.Text=ah.Name;t.Color=Color3.new(1,1,1)end;local a7=#Z+1;Z[a7]={p=ah,t=t}end)for aa,ab in pairs(ak["Game_Items"]:GetChildren())do local z=a4[ab.Name]local t=Drawing.new("Text")t.Visible=true;t.Outline=true;t.OutlineColor=g(0.1,0.1,0.11)t.Font=Drawing.Fonts.Plex;if z then t.Color=z.c;t.Text=z.t elseif ab.Name:match("eport")then t.Color=Color3.new(0.8,0.8,0.1)t.Text="teleporter"else t.Text=ab.Name;t.Color=Color3.new(1,1,1)end;local a7=#Z+1;Z[a7]={p=ab,t=t}end else if q(ak,"HordeMonsters")then if q(al[c.Name])then _["ItemCheck1"]=al[c.Name].ChildAdded:Connect(function(ah)local z=a4[ah.Name]local t=Drawing.new("Text")t.Visible=true;t.Outline=true;t.OutlineColor=g(0.1,0.1,0.11)t.Font=Drawing.Fonts.Plex;if z then t.Color=z.c;t.Text=z.t else t.Text=ah.Name;t.Color=Color3.new(1,1,1)end;local a7=#Z+1;Z[a7]={p=ah,t=t}end)for aa,ab in pairs(al[c.Name]:GetChildren())do local z=a4[ab.Name]local t=Drawing.new("Text")t.Visible=true;t.Outline=true;t.OutlineColor=g(0.1,0.1,0.11)t.Font=Drawing.Fonts.Plex;if z then t.Color=z.c;t.Text=z.t else t.Text=ab.Name;t.Color=Color3.new(1,1,1)end;local a7=#Z+1;Z[a7]={p=ab,t=t}end end else ak:WaitForChild("Game_Items",4)end end;if not q(al,"Global")then al.ChildAdded:Wait()if B:GetState()==false then return end end;_["ItemCheck2"]=al["Global"].ChildAdded:Connect(function(ah)local z=a4[ah.Name]local t=Drawing.new("Text")t.Visible=true;t.Outline=true;t.OutlineColor=g(0.1,0.1,0.11)t.Font=Drawing.Fonts.Plex;if z then t.Color=z.c;t.Text=z.t else t.Text=ah.Name;t.Color=Color3.new(1,1,1)end;local a7=#Z+1;Z[a7]={p=ah,t=t}end)for aa,ab in pairs(al["Global"]:GetChildren())do local z=a4[ab.Name]local t=Drawing.new("Text")t.Visible=true;t.Outline=true;t.OutlineColor=g(0.1,0.1,0.11)t.Font=Drawing.Fonts.Plex;if z then t.Color=z.c;t.Text=z.t else t.Text=ab.Name;t.Color=Color3.new(1,1,1)end;local a7=#Z+1;Z[a7]={p=ab,t=t}end;local ac=workspace.CurrentCamera;local ad=Drawing.new("Text")ad.Visible=true;ad.Outline=true;ad.OutlineColor=g(0.1,0.1,0.11)ad.Font=Drawing.Fonts.Plex;ad.Color=Color3.new(0.3,0.9,0.3)ad.Position=Vector2.new(15,900)while B:GetState()do ad.Text="Item ESP objects: "..tostring(#Z)for a7,ab in pairs(Z)do local af=pcall(function()local an=ab['t']local aa=q(ab['p'],"PrimaryPart")or ab['p']local ai,aj=ac:WorldToViewportPoint(aa.Position+e(0,1,0))an.Visible=aj;an.Position=f(ai.X-an.TextBounds.X*0.5,ai.Y)end)if ab['p'].Parent==nil then ab['t']:Remove()ab['t']=nil;l(Z,a7)end;if a7%10==0 then h()end end;h()end;ad:Remove()end)end end)B.OnDisable:Connect(function()for aa,ab in pairs(Z)do ab['t']:Remove()end;Z={}_["MapCheck1"]:Disconnect()_["MapCheck2"]:Disconnect()if _["ItemCheck1"]then _["ItemCheck1"]:Disconnect()end;_["ItemCheck2"]:Disconnect()end)F.OnEnable:Connect(function()j(function()while F:GetState()do c.CameraMaxZoomDistance=200;c.CameraMode=Enum.CameraMode.Classic;wait(3)end end)end)F.OnDisable:Connect(function()c.CameraMaxZoomDistance=12 end)G.OnClick:Connect(function()game.UserInputService.MouseIconEnabled=true end)D.OnClick:Connect(function()local af=pcall(function()o()local ao=c.Character.HumanoidRootPart;local ap=ao.CFrame;ao.CFrame=d(60,107,24)h(0.3)if(ao.Position-e(60,107,24)).Magnitude<10 then v:NewNotification("On cooldown","Wait a bit before trying again",3)end;ao.CFrame=ap;p()end)if not af then v:NewNotification("Didn't work","Wait for your character to spawn, or reset.",3)end end)E.OnEnable:Connect(function()j(function()while E:GetState()do pcall(function()o()local ao=c.Character.HumanoidRootPart;local ap=ao.CFrame;ao.CFrame=d(60,107,24)h(0.3)ao.CFrame=ap;p()end)wait(12)end end)end)H.OnClick:Connect(function()local af=pcall(function()local t=workspace.Map.HordeMonsters;for aa,ab in pairs(t:GetChildren())do for aa=1,30 do a0:FireServer(ab,"Glock")end end end)if not af then v:NewNotification("Oopsies","Not in trick or treat",2)end end)J.OnClick:Connect(function()for aq,ag in pairs(a:GetPlayers())do if ag~=c and ag.Team.Name=="Humans"then pcall(function()local t=c.Character.HumanoidRootPart;local u=ag.Character.HumanoidRootPart;for aa=0,10 do a1:FireServer({["PositionHit"]=u.Position,["TargetPosition"]=u.Position,["Type"]='Standard',["StartPosition"]=t.Position,["PlayerThatFired"]=c,["Config"]=a5,["PlayerHit"]=ag,["PartHit"]=u})end end)end end end)I.OnClick:Connect(function()for aq,ag in pairs(a:GetPlayers())do if ag~=c and ag.Team.Name=="Monsters"then pcall(function()local t=c.Character.HumanoidRootPart;local u=ag.Character.HumanoidRootPart;for aa=0,10 do a1:FireServer({["PositionHit"]=u.Position,["TargetPosition"]=u.Position,["Type"]='Standard',["StartPosition"]=t.Position,["PlayerThatFired"]=c,["Config"]=a5,["PlayerHit"]=ag,["PartHit"]=u})end end)end end end)K.OnClick:Connect(function()for aq,ag in pairs(a:GetPlayers())do if ag~=c then pcall(function()local t=c.Character.HumanoidRootPart;local u=ag.Character.HumanoidRootPart;for aa=0,10 do a1:FireServer({["PositionHit"]=u.Position,["TargetPosition"]=u.Position,["Type"]='Standard',["StartPosition"]=t.Position,["PlayerThatFired"]=c,["Config"]=a5,["PlayerHit"]=ag,["PartHit"]=u})end end)end end end)L.OnClick:Connect(function()local af=pcall(function()local t=workspace.Map.HordeMonsters;for aa,ab in pairs(t:GetChildren())do for aa=1,30 do local ar=ab.PrimaryPart.Position;local ab=e(m(-20,20),100,m(-20,20))a3:FireServer("Tracer",{EndPosition=ar,StartPosition=ar+ab})a2:Fire("Tracer",{EndPosition=ar,StartPosition=ar+ab})a0:FireServer(ab,"Glock")end end end)if not af then v:NewNotification("Oopsies","Not in trick or treat",2)end end)N.OnClick:Connect(function()j(function()for aq,ag in pairs(a:GetPlayers())do if ag~=c and ag.Team.Name=="Humans"then pcall(function()local t=c.Character.HumanoidRootPart;local u=ag.Character.HumanoidRootPart;local ar=u.Position;for as=100,0,-1 do for aa=1,15 do local ab=e(m(-20,20),as,m(-20,20))a3:FireServer("Tracer",{EndPosition=ar,StartPosition=ar+ab})a2:Fire("Tracer",{EndPosition=ar,StartPosition=ar+ab})end;a1:FireServer({["PositionHit"]=u.Position,["TargetPosition"]=u.Position,["Type"]='Standard',["StartPosition"]=t.Position,["PlayerThatFired"]=c,["Config"]=a5,["PlayerHit"]=ag,["PartHit"]=u})h()end end)end end end)end)M.OnClick:Connect(function()j(function()for aq,ag in pairs(a:GetPlayers())do if ag~=c and ag.Team.Name=="Monsters"then pcall(function()local t=c.Character.HumanoidRootPart;local u=ag.Character.HumanoidRootPart;local ar=u.Position;for as=100,0,-1 do for aa=1,15 do local ab=e(m(-20,20),as,m(-20,20))a3:FireServer("Tracer",{EndPosition=ar,StartPosition=ar+ab})a2:Fire("Tracer",{EndPosition=ar,StartPosition=ar+ab})end;a1:FireServer({["PositionHit"]=u.Position,["TargetPosition"]=u.Position,["Type"]='Standard',["StartPosition"]=t.Position,["PlayerThatFired"]=c,["Config"]=a5,["PlayerHit"]=ag,["PartHit"]=u})h()end end)end end end)end)O.OnClick:Connect(function()j(function()for aq,ag in pairs(a:GetPlayers())do if ag.Name~=c.Name then pcall(function()local t=c.Character.HumanoidRootPart;local u=ag.Character.HumanoidRootPart;local ar=u.Position;for as=100,0,-1 do for aa=1,15 do local ab=e(m(-20,20),as,m(-20,20))a3:FireServer("Tracer",{EndPosition=ar,StartPosition=ar+ab})a2:Fire("Tracer",{EndPosition=ar,StartPosition=ar+ab})end;a1:FireServer({["PositionHit"]=u.Position,["TargetPosition"]=u.Position,["Type"]='Standard',["StartPosition"]=t.Position,["PlayerThatFired"]=c,["Config"]=a5,["PlayerHit"]=ag,["PartHit"]=u})h()end end)end end end)end)T.OnValueChanged:Connect(function(at)pcall(function()c.Character.Configuration.Damage.Value=at end)end)U.OnValueChanged:Connect(function(at)pcall(function()c.Character.Configuration.WaitBetweenSlash.Value=at/10 end)end)W.OnEnable:Connect(function()j(function()while W:GetState()do pcall(function()c.Character.CharacterConfig.Stamina.Value=50 end)h()end end)end)V.OnEnable:Connect(function()j(function()while V:GetState()do pcall(function()c.Character.CharacterConfig.Mana.Value=100 end)h()end end)end)P.OnEnable:Connect(function()j(function()while P:GetState()do pcall(function()local ah=c.Character.HumanoidRootPart;for aa,ab in pairs(workspace["DropFolders"]["Global"]:GetChildren())do local au=ab.Part_Collisions;firetouchinterest(ah,au,1)firetouchinterest(ah,au,0)end end)h(2)end end)end)Q.OnClick:Connect(function()local av=q(workspace["DropFolders"],"Global")local aw=q(workspace["DropFolders"],c.Name)local af=pcall(function()local ah=c.Character.HumanoidRootPart;if av then for aa,ab in pairs(av:GetChildren())do local au=ab.Part_Collisions;firetouchinterest(ah,au,1)firetouchinterest(ah,au,0)end else v:NewNotification("Oopsies","Wait for the game to start",2)end;if aw then for aa,ab in pairs(aw:GetChildren())do local au=ab.Part_Collisions;firetouchinterest(ah,au,1)firetouchinterest(ah,au,0)end end end)if not af then v:NewNotification("Oopsies","Didn't work; try resetting",2)end end)R.OnClick:Connect(function()local ak=q(workspace,"Map")if not ak then v:NewNotification("Oopsies","Couldn't get map; is the game started?",2)return end;local ax=q(ak,"Game_Items")if not ax then v:NewNotification("Oopsies","Couldn't get game items; are you in trick or treat?",2)return end;local ah=q(c.Character,"HumanoidRootPart")if not ah then v:NewNotification("Oopsies","You should probably spawn in",2)end;for aa,ab in pairs(ax:GetChildren())do if ab.name=="Game_Clock"then local au=ab.Part_Collisions;firetouchinterest(ah,au,1)firetouchinterest(ah,au,0)end end end)v.Exiting:Connect(function()a5=true;for aa,ab in pairs(v:GetAllToggles())do ab:Disable()end;n:Destroy()end)j(function()while not a5 do for aq,ag in pairs(a:GetPlayers())do local ah=ag.Character;if ah then for aa,ab in pairs(ah:GetDescendants())do if ab:IsA("Folder")then if ab.Name=="Config"then if q(ab,"Damage")then if ab.Parent.Name:match("Tool")then a5=ab;v:NewNotification("Kill all","Kill all loaded and ready to go",3)K:Unhide()I:Unhide()J:Unhide()O:Unhide()N:Unhide()M:Unhide()end;return end end end end end;if a5 then return end end;h(1)end end)S.OnClick:Connect(function()setclipboard("https://discord.gg/Gn9vWr8DJC")v:NewNotification("Thanks!")end)v:Ready()v:NewNotification("Darkenmoor GUI","Made by topit",3)
