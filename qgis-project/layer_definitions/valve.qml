<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyAlgorithm="0" maxScale="0" hasScaleBasedVisibilityFlag="1" simplifyDrawingTol="1" styleCategories="AllStyleCategories" version="3.4.7-Madeira" minScale="10001" labelsEnabled="1" simplifyLocal="1" simplifyDrawingHints="0" simplifyMaxScale="1" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 type="RuleRenderer" forceraster="0" enableorderby="0" symbollevels="0">
    <rules key="{8ac6d04b-1bb5-46e9-b2fb-236cb107ffc9}">
      <rule scalemindenom="1" symbol="0" scalemaxdenom="10000" description="toutes les vannes sauf organe réseau et vanne d'hydrant" key="{7a025dab-c7fe-4c7c-9f0b-25a39f73abd8}" filter="fk_valve_function != 6105 AND fk_valve_function != 6108" label="réseau">
        <rule symbol="1" key="{edf1c363-d849-4700-82d0-34d494178d4d}" filter="closed= 'true'" label="Fermée"/>
        <rule symbol="2" key="{d1ec978f-6d96-4ed2-ac03-a37e6629f13c}" filter="&quot;fk_valve_type&quot; = 6312" label="elgelf"/>
        <rule symbol="3" key="{6c48a279-b0d9-428b-819c-2fc5371720fe}" filter="&quot;fk_valve_type&quot; =6313" label="arrêt"/>
        <rule symbol="4" key="{3bf2a10c-e2fe-43c6-9287-c4055baec2a1}" filter=" &quot;valve_function_value_fr&quot; IN ( 'vidange' ,  'vidange-ventouse' )" label="vidange"/>
      </rule>
      <rule scalemindenom="1" symbol="5" scalemaxdenom="1000" key="{143022c7-b3e1-4c03-80d5-58520da677c2}" filter="fk_valve_function = 6105 OR fk_valve_function = 6108" label="abonné">
        <rule symbol="6" key="{ee4ed8dd-20ae-42fb-b43b-a4c02c5399e9}" filter="closed= 'true'" label="Fermée"/>
        <rule symbol="7" key="{b149b2b9-3783-416c-b413-7a6f7de74e1d}" filter="&quot;fk_valve_type&quot; =6313" label="arrêt"/>
        <rule symbol="8" key="{221f27a3-6778-4b14-8bb9-1b4c7d708bc3}" filter="fk_valve_type = 6312" label="elgelf"/>
        <rule symbol="9" key="{a0c08631-a6ac-4d0b-b538-41bb1efe2315}" filter=" &quot;valve_function_value_fr&quot; IN ( 'vidange' ,  'vidange-ventouse' )" label="vidange"/>
      </rule>
    </rules>
    <symbols>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="0">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="1">
          <prop v="0" k="angle"/>
          <prop v="255,255,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,140,255,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.5" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="area" k="scale_method"/>
          <prop v="3" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="1" k="opacity"/>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="1">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="2">
          <prop v="45" k="angle"/>
          <prop v="0,140,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="line" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,140,255,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="1" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="area" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="1" k="opacity"/>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="2">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="255,255,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="255,255,255,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="1.2" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="area" k="scale_method"/>
          <prop v="1.8" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="1" k="opacity"/>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="3">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="2">
          <prop v="0" k="angle"/>
          <prop v="0,140,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="cross2" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,140,255,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="area" k="scale_method"/>
          <prop v="1.2" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="1" k="opacity"/>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="4">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/vidange_subscriber.svg" k="name"/>
          <prop v="0,-2" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="1" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="2" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="1" k="opacity"/>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="angle">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="coalesce(90 - label_1_r, 45)" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
              </Option>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="5">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="1">
          <prop v="0" k="angle"/>
          <prop v="255,255,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,140,255,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.4" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="area" k="scale_method"/>
          <prop v="2.4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="1" k="opacity"/>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="6">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="3">
          <prop v="45" k="angle"/>
          <prop v="255,0,0,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="line" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="255,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="1" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="area" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="1" k="opacity"/>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="7">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="2">
          <prop v="0" k="angle"/>
          <prop v="0,140,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="cross2" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,140,255,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.3" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="area" k="scale_method"/>
          <prop v="1.2" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="1" k="opacity"/>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="8">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="255,255,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="255,255,255,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="1.2" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="area" k="scale_method"/>
          <prop v="1.8" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="1" k="opacity"/>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="9">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/vidange_subscriber.svg" k="name"/>
          <prop v="0,-2" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="1" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="2" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="1" k="opacity"/>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="angle">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="coalesce(90 - label_1_r, 45)" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
              </Option>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <effect enabled="0" type="effectStack">
      <effect type="drawSource">
        <prop v="0" k="blend_mode"/>
        <prop v="2" k="draw_mode"/>
        <prop v="1" k="enabled"/>
        <prop v="1" k="opacity"/>
      </effect>
    </effect>
  </renderer-v2>
  <labeling type="simple">
    <settings>
      <text-style fontFamily="DejaVu Sans" useSubstitutions="0" fontUnderline="0" fontItalic="0" fontWordSpacing="0" fontStrikeout="0" fieldName="COALESCE(&quot;valve_function_short_fr&quot;,'')&#xa;||&#xa;COALESCE(&quot;valve_type_short_fr&quot;,'')&#xa;|| &#xa;identification&#xa;||&#xa;CASE&#xa;WHEN  $scale  &lt;= 6000  THEN COALESCE(' ' ||&quot;label_1_text&quot;,'')&#xa;ELSE ''&#xa;END" blendMode="0" fontSizeUnit="Point" textOpacity="1" textColor="217,0,0,255" multilineHeight="1" namedStyle="Book" fontSize="7.2" isExpression="1" fontWeight="50" previewBkgrdColor="#ffffff" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontLetterSpacing="0" fontCapitals="0">
        <text-buffer bufferOpacity="1" bufferSizeUnits="MM" bufferColor="255,255,255,255" bufferJoinStyle="64" bufferNoFill="0" bufferDraw="1" bufferSize="1" bufferBlendMode="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0"/>
        <background shapeSizeX="0" shapeBorderColor="128,128,128,255" shapeDraw="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetX="0" shapeBorderWidth="0" shapeRadiiY="0" shapeRotation="0" shapeSizeY="0" shapeOpacity="1" shapeSizeUnit="MM" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeType="0" shapeBorderWidthUnit="MM" shapeBlendMode="0" shapeSizeType="0" shapeFillColor="255,255,255,255" shapeRotationType="0" shapeRadiiX="0" shapeSVGFile="" shapeRadiiUnit="MM" shapeOffsetUnit="MM" shapeJoinStyle="64" shapeOffsetY="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0"/>
        <shadow shadowOffsetAngle="135" shadowRadiusAlphaOnly="0" shadowColor="0,0,0,255" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowDraw="0" shadowRadiusUnit="MM" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowUnder="0" shadowOpacity="0.7" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowRadius="1.5" shadowOffsetGlobal="1" shadowScale="100" shadowBlendMode="6"/>
        <substitutions/>
      </text-style>
      <text-format multilineAlign="0" plussign="0" decimals="0" useMaxLineLengthForAutoWrap="1" addDirectionSymbol="0" placeDirectionSymbol="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0" rightDirectionSymbol=">" wrapChar="" autoWrapLength="0" formatNumbers="0"/>
      <placement rotationAngle="0" fitInPolygonOnly="0" offsetType="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" offsetUnits="MapUnit" centroidInside="0" quadOffset="4" repeatDistance="0" maxCurvedCharAngleIn="20" yOffset="0" xOffset="0" centroidWhole="0" distMapUnitScale="3x:0,0,0,0,0,0" maxCurvedCharAngleOut="-20" repeatDistanceUnits="MM" distUnits="MM" preserveRotation="1" priority="10" placement="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" placementFlags="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" dist="1"/>
      <rendering scaleVisibility="1" obstacleType="0" obstacle="1" upsidedownLabels="0" scaleMax="10000" limitNumLabels="0" displayAll="1" drawLabels="1" maxNumLabels="2000" obstacleFactor="1" fontMaxPixelSize="10000" scaleMin="1" fontLimitPixelSize="0" fontMinPixelSize="3" mergeLines="0" zIndex="0" labelPerPart="0" minFeatureSize="0"/>
      <dd_properties>
        <Option type="Map">
          <Option value="" type="QString" name="name"/>
          <Option type="Map" name="properties">
            <Option type="Map" name="AlwaysShow">
              <Option value="true" type="bool" name="active"/>
              <Option value="CASE WHEN  &quot;label_1_visible&quot; = 2 THEN 1 ELSE 0 END" type="QString" name="expression"/>
              <Option value="3" type="int" name="type"/>
            </Option>
            <Option type="Map" name="LabelRotation">
              <Option value="true" type="bool" name="active"/>
              <Option value="360 - (&quot;label_1_rotation&quot;)" type="QString" name="expression"/>
              <Option value="3" type="int" name="type"/>
            </Option>
            <Option type="Map" name="PositionX">
              <Option value="true" type="bool" name="active"/>
              <Option value="label_1_x" type="QString" name="field"/>
              <Option value="2" type="int" name="type"/>
            </Option>
            <Option type="Map" name="PositionY">
              <Option value="true" type="bool" name="active"/>
              <Option value="label_1_y" type="QString" name="field"/>
              <Option value="2" type="int" name="type"/>
            </Option>
            <Option type="Map" name="Show">
              <Option value="true" type="bool" name="active"/>
              <Option value="label_1_visible" type="QString" name="field"/>
              <Option value="2" type="int" name="type"/>
            </Option>
          </Option>
          <Option value="collection" type="QString" name="type"/>
        </Option>
      </dd_properties>
    </settings>
  </labeling>
  <customproperties>
    <property key="dualview/previewExpressions">
      <value>id</value>
    </property>
    <property value="0" key="embeddedWidgets/count"/>
    <property value="no" key="itemBrowserConnected"/>
    <property value="95" key="itemBrowserCurrentItem"/>
    <property value="[]" key="itemBrowserSelection"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Pie" attributeLegend="1">
    <DiagramCategory backgroundAlpha="255" penColor="#000000" maxScaleDenominator="10001" height="15" minScaleDenominator="0" penAlpha="255" opacity="1" sizeType="MM" barWidth="5" scaleDependency="Area" width="15" minimumSize="0" lineSizeScale="3x:0,0,0,0,0,0" diagramOrientation="Up" lineSizeType="MM" sizeScale="3x:0,0,0,0,0,0" rotationOffset="270" labelPlacementMethod="XHeight" enabled="0" scaleBasedVisibility="1" penWidth="0" backgroundColor="#ffffff">
      <fontProperties description="Cantarell,11,-1,5,50,0,0,0,0,0" style=""/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" priority="0" zIndex="0" obstacle="0" linePlacementFlags="2" showAll="1" placement="0">
    <properties>
      <Option type="Map">
        <Option value="" type="QString" name="name"/>
        <Option type="Map" name="properties">
          <Option type="Map" name="show">
            <Option value="true" type="bool" name="active"/>
            <Option value="id" type="QString" name="field"/>
            <Option value="2" type="int" name="type"/>
          </Option>
        </Option>
        <Option value="collection" type="QString" name="type"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="id">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_valve_type">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_valve_type20130304110011685" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_valve_function">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_valve_function20130304110011544" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_valve_actuation">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="valve_actuation20150608112911022" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_pipe">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowAddFeatures"/>
            <Option value="true" type="bool" name="AllowNULL"/>
            <Option value="true" type="bool" name="MapIdentification"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="true" type="bool" name="ReadOnly"/>
            <Option value="relation_valve_pipe" type="QString" name="Relation"/>
            <Option value="false" type="bool" name="ShowForm"/>
            <Option value="true" type="bool" name="ShowOpenFormButton"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_handle_precision">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_precision20130304110011372" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_handle_precisionalti">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_precisionalti20131211161429510" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_maintenance">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_valve_maintenance20130304110011567" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="diameter_nominal">
      <editWidget type="UniqueValues">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="Editable"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="closed">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="networkseparation">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="handle_altitude">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="handle_geometry">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_district">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="district20130304110004764" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="true" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="name" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_pressurezone">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="pressurezone20130417133612105" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="true" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="name" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_distributor">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="distributor20130304114719702" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="name" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_precision">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_precision20130304110011372" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_precisionalti">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_precisionalti20131211161429510" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_status">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_status20130304110011436" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_object_reference">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="object_reference20150922083109152" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_folder">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowAddFeatures"/>
            <Option value="true" type="bool" name="AllowNULL"/>
            <Option value="false" type="bool" name="MapIdentification"/>
            <Option value="true" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="ReadOnly"/>
            <Option value="relation_vanne_folder" type="QString" name="Relation"/>
            <Option value="false" type="bool" name="ShowForm"/>
            <Option value="true" type="bool" name="ShowOpenFormButton"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="year">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="year_end">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="altitude">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="orientation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_locationtype">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="identification">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="remark">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_printmap">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_geometry_alt1_used">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_geometry_alt2_used">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_pipe_node_type">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_pipe_orientation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_pipe_schema_visible">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_printmaps">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="geometry_alt1">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="geometry_alt2">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="update_geometry_alt1">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="update_geometry_alt2">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_visible">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="vl_code_int" type="QString" name="Key"/>
            <Option value="vl_visible20130304110011703" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_x">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_y">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_rotation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_text">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_visible">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="vl_code_int" type="QString" name="Key"/>
            <Option value="vl_visible20130304110011703" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_x">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_y">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_rotation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_text">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="schema_force_visible">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="vl_code" type="QString" name="Key"/>
            <Option value="vl_visible20130304110011703" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_schema_visible">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_function_vl_active">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_function_short_fr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_function_short_en">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_function_short_ro">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_function_value_fr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_function_value_en">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_function_value_ro">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_function_description_fr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_function_description_en">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_function_description_ro">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_function_schema_visible">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_type_vl_active">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_type_short_fr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_type_short_en">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_type_short_ro">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_type_value_fr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_type_value_en">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_type_value_ro">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_type_description_fr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_type_description_en">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_type_description_ro">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_actuation_id">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_actuation_vl_active">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_actuation_short_fr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_actuation_value_fr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_actuation_description_fr">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="valve_actuation_schema_visible">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="status_active">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="status_functional">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="id" index="0" name="ID"/>
    <alias field="fk_valve_type" index="1" name="Type"/>
    <alias field="fk_valve_function" index="2" name="Fonction"/>
    <alias field="fk_valve_actuation" index="3" name="Actionnement"/>
    <alias field="fk_pipe" index="4" name="Conduite"/>
    <alias field="fk_handle_precision" index="5" name="Précision de la position de la tige"/>
    <alias field="fk_handle_precisionalti" index="6" name="Précision de l'altitude de la tige"/>
    <alias field="fk_maintenance" index="7" name="Maintenance"/>
    <alias field="diameter_nominal" index="8" name="Diamètre nominal"/>
    <alias field="closed" index="9" name="Fermée"/>
    <alias field="networkseparation" index="10" name="Séparation réseau"/>
    <alias field="handle_altitude" index="11" name="Altitude tige"/>
    <alias field="handle_geometry" index="12" name=""/>
    <alias field="fk_district" index="13" name="Commune"/>
    <alias field="fk_pressurezone" index="14" name="Zone de pression"/>
    <alias field="fk_distributor" index="15" name="Distributeur"/>
    <alias field="fk_precision" index="16" name="Précision"/>
    <alias field="fk_precisionalti" index="17" name="Précision alti."/>
    <alias field="fk_status" index="18" name="Statut"/>
    <alias field="fk_object_reference" index="19" name="Pt. de réf."/>
    <alias field="fk_folder" index="20" name="Dossier technique"/>
    <alias field="year" index="21" name="Année"/>
    <alias field="year_end" index="22" name=""/>
    <alias field="altitude" index="23" name="Altitude réelle"/>
    <alias field="orientation" index="24" name=""/>
    <alias field="fk_locationtype" index="25" name=" "/>
    <alias field="identification" index="26" name="Identification"/>
    <alias field="remark" index="27" name="remarques"/>
    <alias field="fk_printmap" index="28" name="folio"/>
    <alias field="_geometry_alt1_used" index="29" name=""/>
    <alias field="_geometry_alt2_used" index="30" name=""/>
    <alias field="_pipe_node_type" index="31" name=""/>
    <alias field="_pipe_orientation" index="32" name=""/>
    <alias field="_pipe_schema_visible" index="33" name=""/>
    <alias field="_printmaps" index="34" name="Folios"/>
    <alias field="geometry_alt1" index="35" name=""/>
    <alias field="geometry_alt2" index="36" name=""/>
    <alias field="update_geometry_alt1" index="37" name=""/>
    <alias field="update_geometry_alt2" index="38" name=""/>
    <alias field="label_1_visible" index="39" name="1/250"/>
    <alias field="label_1_x" index="40" name=""/>
    <alias field="label_1_y" index="41" name=""/>
    <alias field="label_1_rotation" index="42" name=""/>
    <alias field="label_1_text" index="43" name=" "/>
    <alias field="label_2_visible" index="44" name="1/5000"/>
    <alias field="label_2_x" index="45" name=""/>
    <alias field="label_2_y" index="46" name=""/>
    <alias field="label_2_rotation" index="47" name=""/>
    <alias field="label_2_text" index="48" name=" "/>
    <alias field="schema_force_visible" index="49" name="Visibilité"/>
    <alias field="_schema_visible" index="50" name=""/>
    <alias field="valve_function_vl_active" index="51" name=""/>
    <alias field="valve_function_short_fr" index="52" name=""/>
    <alias field="valve_function_short_en" index="53" name=""/>
    <alias field="valve_function_short_ro" index="54" name=""/>
    <alias field="valve_function_value_fr" index="55" name=""/>
    <alias field="valve_function_value_en" index="56" name=""/>
    <alias field="valve_function_value_ro" index="57" name=""/>
    <alias field="valve_function_description_fr" index="58" name=""/>
    <alias field="valve_function_description_en" index="59" name=""/>
    <alias field="valve_function_description_ro" index="60" name=""/>
    <alias field="valve_function_schema_visible" index="61" name=""/>
    <alias field="valve_type_vl_active" index="62" name=""/>
    <alias field="valve_type_short_fr" index="63" name=""/>
    <alias field="valve_type_short_en" index="64" name=""/>
    <alias field="valve_type_short_ro" index="65" name=""/>
    <alias field="valve_type_value_fr" index="66" name=""/>
    <alias field="valve_type_value_en" index="67" name=""/>
    <alias field="valve_type_value_ro" index="68" name=""/>
    <alias field="valve_type_description_fr" index="69" name=""/>
    <alias field="valve_type_description_en" index="70" name=""/>
    <alias field="valve_type_description_ro" index="71" name=""/>
    <alias field="valve_actuation_id" index="72" name=""/>
    <alias field="valve_actuation_vl_active" index="73" name=""/>
    <alias field="valve_actuation_short_fr" index="74" name=""/>
    <alias field="valve_actuation_value_fr" index="75" name=""/>
    <alias field="valve_actuation_description_fr" index="76" name=""/>
    <alias field="valve_actuation_schema_visible" index="77" name=""/>
    <alias field="status_active" index="78" name=""/>
    <alias field="status_functional" index="79" name=""/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="id" expression="" applyOnUpdate="0"/>
    <default field="fk_valve_type" expression="" applyOnUpdate="0"/>
    <default field="fk_valve_function" expression="" applyOnUpdate="0"/>
    <default field="fk_valve_actuation" expression="" applyOnUpdate="0"/>
    <default field="fk_pipe" expression="" applyOnUpdate="0"/>
    <default field="fk_handle_precision" expression="" applyOnUpdate="0"/>
    <default field="fk_handle_precisionalti" expression="" applyOnUpdate="0"/>
    <default field="fk_maintenance" expression="" applyOnUpdate="0"/>
    <default field="diameter_nominal" expression="" applyOnUpdate="0"/>
    <default field="closed" expression="" applyOnUpdate="0"/>
    <default field="networkseparation" expression="" applyOnUpdate="0"/>
    <default field="handle_altitude" expression="" applyOnUpdate="0"/>
    <default field="handle_geometry" expression="" applyOnUpdate="0"/>
    <default field="fk_district" expression="" applyOnUpdate="0"/>
    <default field="fk_pressurezone" expression="" applyOnUpdate="0"/>
    <default field="fk_distributor" expression="" applyOnUpdate="0"/>
    <default field="fk_precision" expression="" applyOnUpdate="0"/>
    <default field="fk_precisionalti" expression="" applyOnUpdate="0"/>
    <default field="fk_status" expression="" applyOnUpdate="0"/>
    <default field="fk_object_reference" expression="" applyOnUpdate="0"/>
    <default field="fk_folder" expression="" applyOnUpdate="0"/>
    <default field="year" expression="" applyOnUpdate="0"/>
    <default field="year_end" expression="" applyOnUpdate="0"/>
    <default field="altitude" expression="" applyOnUpdate="0"/>
    <default field="orientation" expression="" applyOnUpdate="0"/>
    <default field="fk_locationtype" expression="" applyOnUpdate="0"/>
    <default field="identification" expression="" applyOnUpdate="0"/>
    <default field="remark" expression="" applyOnUpdate="0"/>
    <default field="fk_printmap" expression="" applyOnUpdate="0"/>
    <default field="_geometry_alt1_used" expression="" applyOnUpdate="0"/>
    <default field="_geometry_alt2_used" expression="" applyOnUpdate="0"/>
    <default field="_pipe_node_type" expression="" applyOnUpdate="0"/>
    <default field="_pipe_orientation" expression="" applyOnUpdate="0"/>
    <default field="_pipe_schema_visible" expression="" applyOnUpdate="0"/>
    <default field="_printmaps" expression="" applyOnUpdate="0"/>
    <default field="geometry_alt1" expression="" applyOnUpdate="0"/>
    <default field="geometry_alt2" expression="" applyOnUpdate="0"/>
    <default field="update_geometry_alt1" expression="" applyOnUpdate="0"/>
    <default field="update_geometry_alt2" expression="" applyOnUpdate="0"/>
    <default field="label_1_visible" expression="" applyOnUpdate="0"/>
    <default field="label_1_x" expression="" applyOnUpdate="0"/>
    <default field="label_1_y" expression="" applyOnUpdate="0"/>
    <default field="label_1_rotation" expression="" applyOnUpdate="0"/>
    <default field="label_1_text" expression="" applyOnUpdate="0"/>
    <default field="label_2_visible" expression="" applyOnUpdate="0"/>
    <default field="label_2_x" expression="" applyOnUpdate="0"/>
    <default field="label_2_y" expression="" applyOnUpdate="0"/>
    <default field="label_2_rotation" expression="" applyOnUpdate="0"/>
    <default field="label_2_text" expression="" applyOnUpdate="0"/>
    <default field="schema_force_visible" expression="" applyOnUpdate="0"/>
    <default field="_schema_visible" expression="" applyOnUpdate="0"/>
    <default field="valve_function_vl_active" expression="" applyOnUpdate="0"/>
    <default field="valve_function_short_fr" expression="" applyOnUpdate="0"/>
    <default field="valve_function_short_en" expression="" applyOnUpdate="0"/>
    <default field="valve_function_short_ro" expression="" applyOnUpdate="0"/>
    <default field="valve_function_value_fr" expression="" applyOnUpdate="0"/>
    <default field="valve_function_value_en" expression="" applyOnUpdate="0"/>
    <default field="valve_function_value_ro" expression="" applyOnUpdate="0"/>
    <default field="valve_function_description_fr" expression="" applyOnUpdate="0"/>
    <default field="valve_function_description_en" expression="" applyOnUpdate="0"/>
    <default field="valve_function_description_ro" expression="" applyOnUpdate="0"/>
    <default field="valve_function_schema_visible" expression="" applyOnUpdate="0"/>
    <default field="valve_type_vl_active" expression="" applyOnUpdate="0"/>
    <default field="valve_type_short_fr" expression="" applyOnUpdate="0"/>
    <default field="valve_type_short_en" expression="" applyOnUpdate="0"/>
    <default field="valve_type_short_ro" expression="" applyOnUpdate="0"/>
    <default field="valve_type_value_fr" expression="" applyOnUpdate="0"/>
    <default field="valve_type_value_en" expression="" applyOnUpdate="0"/>
    <default field="valve_type_value_ro" expression="" applyOnUpdate="0"/>
    <default field="valve_type_description_fr" expression="" applyOnUpdate="0"/>
    <default field="valve_type_description_en" expression="" applyOnUpdate="0"/>
    <default field="valve_type_description_ro" expression="" applyOnUpdate="0"/>
    <default field="valve_actuation_id" expression="" applyOnUpdate="0"/>
    <default field="valve_actuation_vl_active" expression="" applyOnUpdate="0"/>
    <default field="valve_actuation_short_fr" expression="" applyOnUpdate="0"/>
    <default field="valve_actuation_value_fr" expression="" applyOnUpdate="0"/>
    <default field="valve_actuation_description_fr" expression="" applyOnUpdate="0"/>
    <default field="valve_actuation_schema_visible" expression="" applyOnUpdate="0"/>
    <default field="status_active" expression="" applyOnUpdate="0"/>
    <default field="status_functional" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint field="id" notnull_strength="1" unique_strength="1" exp_strength="0" constraints="3"/>
    <constraint field="fk_valve_type" notnull_strength="1" unique_strength="0" exp_strength="0" constraints="1"/>
    <constraint field="fk_valve_function" notnull_strength="1" unique_strength="0" exp_strength="0" constraints="1"/>
    <constraint field="fk_valve_actuation" notnull_strength="1" unique_strength="0" exp_strength="0" constraints="1"/>
    <constraint field="fk_pipe" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_handle_precision" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_handle_precisionalti" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_maintenance" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="diameter_nominal" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="closed" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="networkseparation" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="handle_altitude" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="handle_geometry" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_district" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_pressurezone" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_distributor" notnull_strength="1" unique_strength="0" exp_strength="0" constraints="1"/>
    <constraint field="fk_precision" notnull_strength="1" unique_strength="0" exp_strength="0" constraints="1"/>
    <constraint field="fk_precisionalti" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_status" notnull_strength="1" unique_strength="0" exp_strength="0" constraints="1"/>
    <constraint field="fk_object_reference" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_folder" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="year" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="year_end" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="altitude" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="orientation" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_locationtype" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="identification" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="remark" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_printmap" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="_geometry_alt1_used" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="_geometry_alt2_used" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="_pipe_node_type" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="_pipe_orientation" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="_pipe_schema_visible" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="_printmaps" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="geometry_alt1" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="geometry_alt2" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="update_geometry_alt1" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="update_geometry_alt2" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="label_1_visible" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="label_1_x" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="label_1_y" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="label_1_rotation" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="label_1_text" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="label_2_visible" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="label_2_x" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="label_2_y" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="label_2_rotation" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="label_2_text" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="schema_force_visible" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="_schema_visible" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_function_vl_active" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_function_short_fr" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_function_short_en" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_function_short_ro" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_function_value_fr" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_function_value_en" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_function_value_ro" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_function_description_fr" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_function_description_en" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_function_description_ro" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_function_schema_visible" notnull_strength="1" unique_strength="0" exp_strength="0" constraints="1"/>
    <constraint field="valve_type_vl_active" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_type_short_fr" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_type_short_en" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_type_short_ro" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_type_value_fr" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_type_value_en" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_type_value_ro" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_type_description_fr" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_type_description_en" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_type_description_ro" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_actuation_id" notnull_strength="1" unique_strength="1" exp_strength="0" constraints="3"/>
    <constraint field="valve_actuation_vl_active" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_actuation_short_fr" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_actuation_value_fr" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_actuation_description_fr" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="valve_actuation_schema_visible" notnull_strength="1" unique_strength="0" exp_strength="0" constraints="1"/>
    <constraint field="status_active" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="status_functional" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="id" exp="" desc=""/>
    <constraint field="fk_valve_type" exp="" desc=""/>
    <constraint field="fk_valve_function" exp="" desc=""/>
    <constraint field="fk_valve_actuation" exp="" desc=""/>
    <constraint field="fk_pipe" exp="" desc=""/>
    <constraint field="fk_handle_precision" exp="" desc=""/>
    <constraint field="fk_handle_precisionalti" exp="" desc=""/>
    <constraint field="fk_maintenance" exp="" desc=""/>
    <constraint field="diameter_nominal" exp="" desc=""/>
    <constraint field="closed" exp="" desc=""/>
    <constraint field="networkseparation" exp="" desc=""/>
    <constraint field="handle_altitude" exp="" desc=""/>
    <constraint field="handle_geometry" exp="" desc=""/>
    <constraint field="fk_district" exp="" desc=""/>
    <constraint field="fk_pressurezone" exp="" desc=""/>
    <constraint field="fk_distributor" exp="" desc=""/>
    <constraint field="fk_precision" exp="" desc=""/>
    <constraint field="fk_precisionalti" exp="" desc=""/>
    <constraint field="fk_status" exp="" desc=""/>
    <constraint field="fk_object_reference" exp="" desc=""/>
    <constraint field="fk_folder" exp="" desc=""/>
    <constraint field="year" exp="" desc=""/>
    <constraint field="year_end" exp="" desc=""/>
    <constraint field="altitude" exp="" desc=""/>
    <constraint field="orientation" exp="" desc=""/>
    <constraint field="fk_locationtype" exp="" desc=""/>
    <constraint field="identification" exp="" desc=""/>
    <constraint field="remark" exp="" desc=""/>
    <constraint field="fk_printmap" exp="" desc=""/>
    <constraint field="_geometry_alt1_used" exp="" desc=""/>
    <constraint field="_geometry_alt2_used" exp="" desc=""/>
    <constraint field="_pipe_node_type" exp="" desc=""/>
    <constraint field="_pipe_orientation" exp="" desc=""/>
    <constraint field="_pipe_schema_visible" exp="" desc=""/>
    <constraint field="_printmaps" exp="" desc=""/>
    <constraint field="geometry_alt1" exp="" desc=""/>
    <constraint field="geometry_alt2" exp="" desc=""/>
    <constraint field="update_geometry_alt1" exp="" desc=""/>
    <constraint field="update_geometry_alt2" exp="" desc=""/>
    <constraint field="label_1_visible" exp="" desc=""/>
    <constraint field="label_1_x" exp="" desc=""/>
    <constraint field="label_1_y" exp="" desc=""/>
    <constraint field="label_1_rotation" exp="" desc=""/>
    <constraint field="label_1_text" exp="" desc=""/>
    <constraint field="label_2_visible" exp="" desc=""/>
    <constraint field="label_2_x" exp="" desc=""/>
    <constraint field="label_2_y" exp="" desc=""/>
    <constraint field="label_2_rotation" exp="" desc=""/>
    <constraint field="label_2_text" exp="" desc=""/>
    <constraint field="schema_force_visible" exp="" desc=""/>
    <constraint field="_schema_visible" exp="" desc=""/>
    <constraint field="valve_function_vl_active" exp="" desc=""/>
    <constraint field="valve_function_short_fr" exp="" desc=""/>
    <constraint field="valve_function_short_en" exp="" desc=""/>
    <constraint field="valve_function_short_ro" exp="" desc=""/>
    <constraint field="valve_function_value_fr" exp="" desc=""/>
    <constraint field="valve_function_value_en" exp="" desc=""/>
    <constraint field="valve_function_value_ro" exp="" desc=""/>
    <constraint field="valve_function_description_fr" exp="" desc=""/>
    <constraint field="valve_function_description_en" exp="" desc=""/>
    <constraint field="valve_function_description_ro" exp="" desc=""/>
    <constraint field="valve_function_schema_visible" exp="" desc=""/>
    <constraint field="valve_type_vl_active" exp="" desc=""/>
    <constraint field="valve_type_short_fr" exp="" desc=""/>
    <constraint field="valve_type_short_en" exp="" desc=""/>
    <constraint field="valve_type_short_ro" exp="" desc=""/>
    <constraint field="valve_type_value_fr" exp="" desc=""/>
    <constraint field="valve_type_value_en" exp="" desc=""/>
    <constraint field="valve_type_value_ro" exp="" desc=""/>
    <constraint field="valve_type_description_fr" exp="" desc=""/>
    <constraint field="valve_type_description_en" exp="" desc=""/>
    <constraint field="valve_type_description_ro" exp="" desc=""/>
    <constraint field="valve_actuation_id" exp="" desc=""/>
    <constraint field="valve_actuation_vl_active" exp="" desc=""/>
    <constraint field="valve_actuation_short_fr" exp="" desc=""/>
    <constraint field="valve_actuation_value_fr" exp="" desc=""/>
    <constraint field="valve_actuation_description_fr" exp="" desc=""/>
    <constraint field="valve_actuation_schema_visible" exp="" desc=""/>
    <constraint field="status_active" exp="" desc=""/>
    <constraint field="status_functional" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
    <actionsetting capture="0" icon="" isEnabledOnlyWhenEditable="0" notificationMessage="" type="1" id="{d73f8b49-7a98-44e5-9863-6292da7cc60f}" name="History audit" shortTitle="" action="qgis.utils.plugins['postgres91plusauditor'].showHistory('valve20130304110011497',[% $id %])">
      <actionScope id="Field"/>
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column hidden="0" type="field" name="id" width="-1"/>
      <column hidden="0" type="field" name="fk_valve_type" width="-1"/>
      <column hidden="0" type="field" name="fk_valve_function" width="-1"/>
      <column hidden="0" type="field" name="fk_valve_actuation" width="-1"/>
      <column hidden="0" type="field" name="fk_pipe" width="-1"/>
      <column hidden="0" type="field" name="fk_handle_precision" width="-1"/>
      <column hidden="0" type="field" name="fk_handle_precisionalti" width="-1"/>
      <column hidden="0" type="field" name="fk_maintenance" width="-1"/>
      <column hidden="0" type="field" name="diameter_nominal" width="-1"/>
      <column hidden="0" type="field" name="closed" width="-1"/>
      <column hidden="0" type="field" name="networkseparation" width="-1"/>
      <column hidden="0" type="field" name="handle_altitude" width="-1"/>
      <column hidden="0" type="field" name="handle_geometry" width="-1"/>
      <column hidden="0" type="field" name="fk_district" width="-1"/>
      <column hidden="0" type="field" name="fk_pressurezone" width="-1"/>
      <column hidden="0" type="field" name="fk_distributor" width="-1"/>
      <column hidden="0" type="field" name="fk_precision" width="-1"/>
      <column hidden="0" type="field" name="fk_precisionalti" width="-1"/>
      <column hidden="0" type="field" name="fk_status" width="-1"/>
      <column hidden="0" type="field" name="fk_object_reference" width="-1"/>
      <column hidden="0" type="field" name="fk_folder" width="-1"/>
      <column hidden="0" type="field" name="year" width="-1"/>
      <column hidden="0" type="field" name="year_end" width="-1"/>
      <column hidden="0" type="field" name="altitude" width="-1"/>
      <column hidden="0" type="field" name="orientation" width="-1"/>
      <column hidden="0" type="field" name="fk_locationtype" width="-1"/>
      <column hidden="0" type="field" name="identification" width="-1"/>
      <column hidden="0" type="field" name="remark" width="-1"/>
      <column hidden="0" type="field" name="fk_printmap" width="-1"/>
      <column hidden="0" type="field" name="_geometry_alt1_used" width="-1"/>
      <column hidden="0" type="field" name="_geometry_alt2_used" width="-1"/>
      <column hidden="0" type="field" name="_pipe_node_type" width="-1"/>
      <column hidden="0" type="field" name="_pipe_orientation" width="-1"/>
      <column hidden="0" type="field" name="_pipe_schema_visible" width="-1"/>
      <column hidden="0" type="field" name="_printmaps" width="-1"/>
      <column hidden="0" type="field" name="geometry_alt1" width="-1"/>
      <column hidden="0" type="field" name="geometry_alt2" width="-1"/>
      <column hidden="0" type="field" name="update_geometry_alt1" width="-1"/>
      <column hidden="0" type="field" name="update_geometry_alt2" width="-1"/>
      <column hidden="0" type="field" name="label_1_visible" width="-1"/>
      <column hidden="0" type="field" name="label_1_x" width="-1"/>
      <column hidden="0" type="field" name="label_1_y" width="-1"/>
      <column hidden="0" type="field" name="label_1_rotation" width="-1"/>
      <column hidden="0" type="field" name="label_1_text" width="-1"/>
      <column hidden="0" type="field" name="label_2_visible" width="-1"/>
      <column hidden="0" type="field" name="label_2_x" width="-1"/>
      <column hidden="0" type="field" name="label_2_y" width="-1"/>
      <column hidden="0" type="field" name="label_2_rotation" width="-1"/>
      <column hidden="0" type="field" name="label_2_text" width="-1"/>
      <column hidden="0" type="field" name="schema_force_visible" width="-1"/>
      <column hidden="0" type="field" name="_schema_visible" width="-1"/>
      <column hidden="0" type="field" name="valve_function_vl_active" width="-1"/>
      <column hidden="0" type="field" name="valve_function_short_fr" width="-1"/>
      <column hidden="0" type="field" name="valve_function_short_en" width="-1"/>
      <column hidden="0" type="field" name="valve_function_short_ro" width="-1"/>
      <column hidden="0" type="field" name="valve_function_value_fr" width="-1"/>
      <column hidden="0" type="field" name="valve_function_value_en" width="-1"/>
      <column hidden="0" type="field" name="valve_function_value_ro" width="-1"/>
      <column hidden="0" type="field" name="valve_function_description_fr" width="-1"/>
      <column hidden="0" type="field" name="valve_function_description_en" width="-1"/>
      <column hidden="0" type="field" name="valve_function_description_ro" width="-1"/>
      <column hidden="0" type="field" name="valve_function_schema_visible" width="-1"/>
      <column hidden="0" type="field" name="valve_type_vl_active" width="-1"/>
      <column hidden="0" type="field" name="valve_type_short_fr" width="-1"/>
      <column hidden="0" type="field" name="valve_type_short_en" width="-1"/>
      <column hidden="0" type="field" name="valve_type_short_ro" width="-1"/>
      <column hidden="0" type="field" name="valve_type_value_fr" width="-1"/>
      <column hidden="0" type="field" name="valve_type_value_en" width="-1"/>
      <column hidden="0" type="field" name="valve_type_value_ro" width="-1"/>
      <column hidden="0" type="field" name="valve_type_description_fr" width="-1"/>
      <column hidden="0" type="field" name="valve_type_description_en" width="-1"/>
      <column hidden="0" type="field" name="valve_type_description_ro" width="-1"/>
      <column hidden="0" type="field" name="valve_actuation_id" width="-1"/>
      <column hidden="0" type="field" name="valve_actuation_vl_active" width="-1"/>
      <column hidden="0" type="field" name="valve_actuation_short_fr" width="-1"/>
      <column hidden="0" type="field" name="valve_actuation_value_fr" width="-1"/>
      <column hidden="0" type="field" name="valve_actuation_description_fr" width="-1"/>
      <column hidden="0" type="field" name="valve_actuation_schema_visible" width="-1"/>
      <column hidden="0" type="field" name="status_active" width="-1"/>
      <column hidden="0" type="field" name="status_functional" width="-1"/>
      <column hidden="1" type="actions" width="-1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1">/home/lbartoletti/QWAT/qgis-project/ui_forms/valve.ui</editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath>/..</editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from PyQt4.QtGui import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" groupBox="0" name="Général" showLabel="1">
      <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="2" visibilityExpression="" groupBox="1" name="" showLabel="0">
        <attributeEditorField index="0" name="id" showLabel="1"/>
        <attributeEditorField index="15" name="fk_distributor" showLabel="1"/>
        <attributeEditorField index="26" name="identification" showLabel="1"/>
        <attributeEditorField index="1" name="fk_valve_type" showLabel="1"/>
        <attributeEditorField index="8" name="diameter_nominal" showLabel="1"/>
        <attributeEditorField index="2" name="fk_valve_function" showLabel="1"/>
        <attributeEditorField index="20" name="fk_folder" showLabel="1"/>
        <attributeEditorField index="3" name="fk_valve_actuation" showLabel="1"/>
        <attributeEditorField index="21" name="year" showLabel="1"/>
        <attributeEditorField index="18" name="fk_status" showLabel="1"/>
        <attributeEditorField index="9" name="closed" showLabel="1"/>
        <attributeEditorField index="10" name="networkseparation" showLabel="1"/>
        <attributeEditorField index="7" name="fk_maintenance" showLabel="1"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
    <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="2" visibilityExpression="" groupBox="0" name="Géométrie" showLabel="1">
      <attributeEditorField index="23" name="altitude" showLabel="1"/>
      <attributeEditorField index="4" name="fk_pipe" showLabel="1"/>
      <attributeEditorField index="17" name="fk_precisionalti" showLabel="1"/>
      <attributeEditorField index="34" name="_printmaps" showLabel="1"/>
      <attributeEditorField index="16" name="fk_precision" showLabel="1"/>
      <attributeEditorField index="13" name="fk_district" showLabel="1"/>
      <attributeEditorField index="19" name="fk_object_reference" showLabel="1"/>
      <attributeEditorField index="14" name="fk_pressurezone" showLabel="1"/>
      <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" groupBox="1" name="" showLabel="1">
        <attributeEditorField index="11" name="handle_altitude" showLabel="1"/>
        <attributeEditorField index="5" name="fk_handle_precision" showLabel="1"/>
        <attributeEditorField index="6" name="fk_handle_precisionalti" showLabel="1"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
    <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="2" visibilityExpression="" groupBox="0" name="Rendu" showLabel="1">
      <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" groupBox="1" name="Schématique" showLabel="1">
        <attributeEditorField index="49" name="schema_force_visible" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="2" visibilityExpression="" groupBox="1" name="Étiquette" showLabel="1">
        <attributeEditorField index="39" name="label_1_visible" showLabel="1"/>
        <attributeEditorField index="43" name="label_1_text" showLabel="0"/>
        <attributeEditorField index="44" name="label_2_visible" showLabel="1"/>
        <attributeEditorField index="48" name="label_2_text" showLabel="0"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
    <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" groupBox="0" name="Emplacement" showLabel="1">
      <attributeEditorField index="25" name="fk_locationtype" showLabel="0"/>
    </attributeEditorContainer>
    <attributeEditorField index="27" name="remark" showLabel="0"/>
  </attributeEditorForm>
  <editable>
    <field name="_geometry_alt1_used" editable="1"/>
    <field name="_geometry_alt2_used" editable="1"/>
    <field name="_pipe_node_type" editable="1"/>
    <field name="_pipe_orientation" editable="1"/>
    <field name="_pipe_schema_visible" editable="1"/>
    <field name="_printmaps" editable="1"/>
    <field name="_schema_visible" editable="1"/>
    <field name="altitude" editable="1"/>
    <field name="closed" editable="1"/>
    <field name="diameter_nominal" editable="1"/>
    <field name="fk_distributor" editable="1"/>
    <field name="fk_district" editable="1"/>
    <field name="fk_folder" editable="1"/>
    <field name="fk_handle_precision" editable="1"/>
    <field name="fk_handle_precisionalti" editable="1"/>
    <field name="fk_locationtype" editable="1"/>
    <field name="fk_maintenance" editable="1"/>
    <field name="fk_object_reference" editable="1"/>
    <field name="fk_pipe" editable="1"/>
    <field name="fk_precision" editable="1"/>
    <field name="fk_precisionalti" editable="1"/>
    <field name="fk_pressurezone" editable="1"/>
    <field name="fk_printmap" editable="1"/>
    <field name="fk_status" editable="1"/>
    <field name="fk_valve_actuation" editable="1"/>
    <field name="fk_valve_function" editable="1"/>
    <field name="fk_valve_type" editable="1"/>
    <field name="geometry_alt1" editable="1"/>
    <field name="geometry_alt2" editable="1"/>
    <field name="handle_altitude" editable="1"/>
    <field name="handle_geometry" editable="1"/>
    <field name="id" editable="1"/>
    <field name="identification" editable="1"/>
    <field name="label_1_rotation" editable="1"/>
    <field name="label_1_text" editable="1"/>
    <field name="label_1_visible" editable="1"/>
    <field name="label_1_x" editable="1"/>
    <field name="label_1_y" editable="1"/>
    <field name="label_2_rotation" editable="1"/>
    <field name="label_2_text" editable="1"/>
    <field name="label_2_visible" editable="1"/>
    <field name="label_2_x" editable="1"/>
    <field name="label_2_y" editable="1"/>
    <field name="networkseparation" editable="1"/>
    <field name="orientation" editable="1"/>
    <field name="remark" editable="1"/>
    <field name="schema_force_visible" editable="1"/>
    <field name="status_active" editable="0"/>
    <field name="status_functional" editable="0"/>
    <field name="update_geometry_alt1" editable="1"/>
    <field name="update_geometry_alt2" editable="1"/>
    <field name="valve_actuation_description_fr" editable="0"/>
    <field name="valve_actuation_id" editable="0"/>
    <field name="valve_actuation_schema_visible" editable="0"/>
    <field name="valve_actuation_short_fr" editable="0"/>
    <field name="valve_actuation_value_fr" editable="0"/>
    <field name="valve_actuation_vl_active" editable="0"/>
    <field name="valve_function_description_en" editable="0"/>
    <field name="valve_function_description_fr" editable="0"/>
    <field name="valve_function_description_ro" editable="0"/>
    <field name="valve_function_schema_visible" editable="0"/>
    <field name="valve_function_short_en" editable="0"/>
    <field name="valve_function_short_fr" editable="0"/>
    <field name="valve_function_short_ro" editable="0"/>
    <field name="valve_function_value_en" editable="0"/>
    <field name="valve_function_value_fr" editable="0"/>
    <field name="valve_function_value_ro" editable="0"/>
    <field name="valve_function_vl_active" editable="0"/>
    <field name="valve_type_description_en" editable="0"/>
    <field name="valve_type_description_fr" editable="0"/>
    <field name="valve_type_description_ro" editable="0"/>
    <field name="valve_type_short_en" editable="0"/>
    <field name="valve_type_short_fr" editable="0"/>
    <field name="valve_type_short_ro" editable="0"/>
    <field name="valve_type_value_en" editable="0"/>
    <field name="valve_type_value_fr" editable="0"/>
    <field name="valve_type_value_ro" editable="0"/>
    <field name="valve_type_vl_active" editable="0"/>
    <field name="year" editable="1"/>
    <field name="year_end" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="_geometry_alt1_used" labelOnTop="0"/>
    <field name="_geometry_alt2_used" labelOnTop="0"/>
    <field name="_pipe_node_type" labelOnTop="0"/>
    <field name="_pipe_orientation" labelOnTop="0"/>
    <field name="_pipe_schema_visible" labelOnTop="0"/>
    <field name="_printmaps" labelOnTop="0"/>
    <field name="_schema_visible" labelOnTop="0"/>
    <field name="altitude" labelOnTop="0"/>
    <field name="closed" labelOnTop="0"/>
    <field name="diameter_nominal" labelOnTop="0"/>
    <field name="fk_distributor" labelOnTop="0"/>
    <field name="fk_district" labelOnTop="0"/>
    <field name="fk_folder" labelOnTop="0"/>
    <field name="fk_handle_precision" labelOnTop="0"/>
    <field name="fk_handle_precisionalti" labelOnTop="0"/>
    <field name="fk_locationtype" labelOnTop="0"/>
    <field name="fk_maintenance" labelOnTop="0"/>
    <field name="fk_object_reference" labelOnTop="0"/>
    <field name="fk_pipe" labelOnTop="0"/>
    <field name="fk_precision" labelOnTop="0"/>
    <field name="fk_precisionalti" labelOnTop="0"/>
    <field name="fk_pressurezone" labelOnTop="0"/>
    <field name="fk_printmap" labelOnTop="0"/>
    <field name="fk_status" labelOnTop="0"/>
    <field name="fk_valve_actuation" labelOnTop="0"/>
    <field name="fk_valve_function" labelOnTop="0"/>
    <field name="fk_valve_type" labelOnTop="0"/>
    <field name="geometry_alt1" labelOnTop="0"/>
    <field name="geometry_alt2" labelOnTop="0"/>
    <field name="handle_altitude" labelOnTop="0"/>
    <field name="handle_geometry" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="identification" labelOnTop="0"/>
    <field name="label_1_rotation" labelOnTop="0"/>
    <field name="label_1_text" labelOnTop="0"/>
    <field name="label_1_visible" labelOnTop="0"/>
    <field name="label_1_x" labelOnTop="0"/>
    <field name="label_1_y" labelOnTop="0"/>
    <field name="label_2_rotation" labelOnTop="0"/>
    <field name="label_2_text" labelOnTop="0"/>
    <field name="label_2_visible" labelOnTop="0"/>
    <field name="label_2_x" labelOnTop="0"/>
    <field name="label_2_y" labelOnTop="0"/>
    <field name="networkseparation" labelOnTop="0"/>
    <field name="orientation" labelOnTop="0"/>
    <field name="remark" labelOnTop="0"/>
    <field name="schema_force_visible" labelOnTop="0"/>
    <field name="status_active" labelOnTop="0"/>
    <field name="status_functional" labelOnTop="0"/>
    <field name="update_geometry_alt1" labelOnTop="0"/>
    <field name="update_geometry_alt2" labelOnTop="0"/>
    <field name="valve_actuation_description_fr" labelOnTop="0"/>
    <field name="valve_actuation_id" labelOnTop="0"/>
    <field name="valve_actuation_schema_visible" labelOnTop="0"/>
    <field name="valve_actuation_short_fr" labelOnTop="0"/>
    <field name="valve_actuation_value_fr" labelOnTop="0"/>
    <field name="valve_actuation_vl_active" labelOnTop="0"/>
    <field name="valve_function_description_en" labelOnTop="0"/>
    <field name="valve_function_description_fr" labelOnTop="0"/>
    <field name="valve_function_description_ro" labelOnTop="0"/>
    <field name="valve_function_schema_visible" labelOnTop="0"/>
    <field name="valve_function_short_en" labelOnTop="0"/>
    <field name="valve_function_short_fr" labelOnTop="0"/>
    <field name="valve_function_short_ro" labelOnTop="0"/>
    <field name="valve_function_value_en" labelOnTop="0"/>
    <field name="valve_function_value_fr" labelOnTop="0"/>
    <field name="valve_function_value_ro" labelOnTop="0"/>
    <field name="valve_function_vl_active" labelOnTop="0"/>
    <field name="valve_type_description_en" labelOnTop="0"/>
    <field name="valve_type_description_fr" labelOnTop="0"/>
    <field name="valve_type_description_ro" labelOnTop="0"/>
    <field name="valve_type_short_en" labelOnTop="0"/>
    <field name="valve_type_short_fr" labelOnTop="0"/>
    <field name="valve_type_short_ro" labelOnTop="0"/>
    <field name="valve_type_value_en" labelOnTop="0"/>
    <field name="valve_type_value_fr" labelOnTop="0"/>
    <field name="valve_type_value_ro" labelOnTop="0"/>
    <field name="valve_type_vl_active" labelOnTop="0"/>
    <field name="year" labelOnTop="0"/>
    <field name="year_end" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>id</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
