
local _NAME, _NS = ...
local DDUF, oUF = _NS[_NAME], _NS.oUF
local media = DDUF.media

local _UNIT = 'targettarget'

DDUF:RegisterStyle(_UNIT, function(self, unit)
    self:SetSize(150, 50)
end)

DDUF:RegisterStyle(_UNIT, function(self, unit)
    local fore = self.FG:CreateTexture(nil, 'ARTWORK')
    fore:SetAllPoints(self.FG)

    self.FG:ClearAllPoints()
    self.FG:SetPoint'CENTER'
    self.FG:SetSize(256, 128)

    self.FG.Texture = fore
    self.FG:SetScale(.7)

    local file = media.tot.tot
    fore:SetTexture(media.getTexture(file))
    self.Textures[fore] = file
end)

DDUF:RegisterStyle(_UNIT, function(self, unit)
    local f = CreateFrame('Frame', nil, self.BG)
    f:SetSize(256, 128)
    f:SetPoint('CENTER', self, -4, 0)
    f:SetScale(.7)

    local bg = self.BG:CreateTexture(nil, 'BACKGROUND')
    bg:SetAllPoints(f)

    local file = media.tot.bg
    bg:SetTexture(media.getTexture(file))

    self.BG.Texture = bg
    self.Textures[bg] = file
end)

DDUF:RegisterStyle(_UNIT, function(self, unit)
    local hp = CreateFrame('StatusBar', nil, self.BG)
    self.Health = hp

    hp:SetStatusBarTexture(media.roth)
    hp:SetSize(55, 12)
    --hp:SetPoint('BOTTOMLEFT', self, 'CENTER', -12, -6)
    hp:SetPoint('TOPLEFT', self, 'CENTER', -10, 5)

    hp.colorClass = true
    hp.colorClassPet = true
    hp.colorClassNPC = true

    hp.bg = hp:CreateTexture(nil, 'BORDER')
    hp.bg:SetTexture(media.roth)
    hp.bg:SetAllPoints()
    hp.bg.multiplier = .3
end)

DDUF:RegisterStyle(_UNIT, function(self, unit)
    local portrait = CreateFrame('PlayerModel', nil, self.BG)
    self.Portrait = portrait

    portrait:SetPoint('BOTTOMRIGHT', self, 'CENTER', -20, -15)
    --portrait:SetPoint('BOTTOMRIGHT', self, 'CENTER', -20, -15)

    local _SIZE = 30
    portrait:SetSize(_SIZE, _SIZE)
end)

DDUF:RegisterStyle(_UNIT, function(self, unit)
    self.Tags.name = self:CreateTag(self.Health, '[raidcolor][name]')
    :SetFont(media.font, 12, 'OUTLINE')
    :SetPoint('TOPLEFT', self, 'CENTER', -5, -12)
    :done()

    self.Tags.level = self:CreateTag(self.FG, '[dd:difficulty][level]')
    :SetFont(media.font, 14, 'OUTLINE')
    :SetPoint('CENTER', self, -22, -16)
    :done()
end)

DDUF:Spawn(_UNIT, function(f)
    f:SetPoint('TOPLEFT', DDUF.units.target, 'BOTTOMLEFT', -35, 15)
end)

