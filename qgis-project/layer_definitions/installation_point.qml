<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyAlgorithm="0" maxScale="100000" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" styleCategories="AllStyleCategories" version="3.4.7-Madeira" minScale="1e+08" labelsEnabled="1" simplifyLocal="1" simplifyDrawingHints="0" simplifyMaxScale="1" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 type="RuleRenderer" forceraster="0" enableorderby="0" symbollevels="0">
    <rules key="{89d1d7f3-6dd2-48ab-a978-572c899af422}">
      <rule key="{69b3bf49-4ced-4bb9-8799-da2f168ad22c}" filter="fk_distributor = 1 AND status_functional= 'true'" label="fonctionnel">
        <rule key="{6f043e9f-1731-47a8-86d1-a6084a99e57b}" filter="status_active= 'true' AND (fk_parent IS NULL OR @map_scale &lt; 501)" label="actif">
          <rule key="{e50fbbc2-a891-4432-a846-34d4f3e99c86}" filter="installation_type = 'chamber'" label="Chambre">
            <rule symbol="0" key="{c5aa7421-12d9-4e1f-b39e-ddc5f7c287e9}" filter="flow_meter= 'true' or water_meter= 'true' or manometer= 'true'" label="Chambre débitmètre"/>
            <rule symbol="1" key="{278ef659-c656-449d-a1c5-7c60acabaa65}" filter="ELSE" label="Chambre"/>
          </rule>
          <rule key="{dcad679b-71a0-497e-b02e-93f46651826b}" filter="installation_type = 'pressurecontrol'" label="pressurecontrol">
            <rule symbol="2" key="{980ea4bf-d999-4d98-b45a-9c3890a64496}" filter=" &quot;fk_pressurecontrol_type&quot; =  2801 " label="Chambre réducteur"/>
            <rule symbol="3" key="{37877255-94b0-449e-ae98-71803ed4ef1c}" filter=" &quot;fk_pressurecontrol_type&quot; =  2802" label="Chambre coupe pression"/>
            <rule symbol="4" key="{7e777116-29bb-4af3-883d-504a8f109298}" filter=" &quot;fk_pressurecontrol_type&quot; =  2803" label="Chambre de rassemblement"/>
          </rule>
          <rule symbol="5" key="{3c04b823-cf69-4ac1-89cf-d04e9bdd4989}" filter="installation_type = 'pump'" label="pump"/>
          <rule symbol="6" key="{6be86ca3-25cf-47e9-a4d8-09d481490c9c}" filter="installation_type = 'source'" label="source"/>
          <rule symbol="7" key="{cdead7aa-d728-472d-b382-91cf70fd6e5f}" filter="installation_type = 'tank'" label="tank"/>
          <rule symbol="8" key="{a841e611-3390-4ae1-b9f5-e7fee4fea027}" filter="installation_type = 'treatment'" label="treatment"/>
          <rule symbol="9" key="{5d01efe9-2c1b-4052-a11f-5ce82dd09f65}" filter="ELSE"/>
        </rule>
        <rule key="{f955cc23-5f5f-4ac6-949b-6711a8862c7a}" filter="status_active= 'false' AND (fk_parent IS NULL OR @map_scale &lt; 501)" label="inactif">
          <rule key="{33dee9ac-9240-41d9-8da7-d047d8521f65}" filter="installation_type = 'chamber'" label="Chambre">
            <rule symbol="10" key="{b30d473c-b7f4-448a-b647-b2a5ceb1a131}" filter="flow_meter= 'true' or water_meter= 'true' or manometer= 'true'" label="Chambre débitmètre"/>
            <rule symbol="11" key="{ee6ec74f-d3e1-435a-90d0-b91da4a9537f}" filter="ELSE" label="Chambre"/>
          </rule>
          <rule key="{dc540c42-11d4-4a71-a720-5c18f763734e}" filter="installation_type = 'pressurecontrol'" label="pressurecontrol">
            <rule symbol="12" key="{e2eb5440-e94b-4c54-a2bc-91b66b6e2c21}" filter=" &quot;fk_pressurecontrol_type&quot; =  2801 " label="Chambre réducteur"/>
            <rule symbol="13" key="{a36e1dd4-a5ba-4a46-8647-4b6ecf6a4e58}" filter=" &quot;fk_pressurecontrol_type&quot; =  2802" label="Chambre coupe pression"/>
            <rule symbol="14" key="{5fb13620-50f9-41de-93f9-9ab384ab087f}" filter=" &quot;fk_pressurecontrol_type&quot; =  2803" label="Chambre de rassemblement"/>
          </rule>
          <rule symbol="15" key="{082eff42-4984-492f-97dc-caedb6a17a07}" filter="installation_type = 'pump'" label="pump"/>
          <rule symbol="16" key="{a6946f96-07f0-4f35-aa70-ad33d6866b8d}" filter="installation_type = 'source'" label="source"/>
          <rule symbol="17" key="{ffab370b-cfc7-4704-9929-5e4dd09ee8f3}" filter="installation_type = 'tank'" label="tank"/>
          <rule symbol="18" key="{224820ff-9d97-46ba-88a8-8073f0a09a29}" filter="installation_type = 'treatment'" label="treatment"/>
          <rule symbol="19" key="{0b8281d6-7c39-44b5-8a40-ecb1889399cb}" filter="ELSE"/>
        </rule>
      </rule>
      <rule key="{1a64d4d9-3bd2-437b-9620-740b13e32509}" filter="fk_distributor = 1 AND status_functional= 'false'" label="non fonctionnel">
        <rule key="{ce0c94bb-b016-41a1-931c-3109807689b0}" filter="installation_type = 'chamber'" label="Chambre">
          <rule symbol="20" key="{f16643c2-ce75-4f94-beee-56389f55aee7}" filter="flow_meter= 'true' or water_meter= 'true' or manometer= 'true'" label="Chambre débitmètre"/>
          <rule symbol="21" key="{8366c510-1142-41fb-85a1-bf9663ad9d11}" filter="ELSE" label="Chambre"/>
        </rule>
        <rule key="{d31ae609-73ec-4d88-8324-5300f14ed738}" filter="installation_type = 'pressurecontrol'" label="pressurecontrol">
          <rule symbol="22" key="{5b2d8e5a-3356-4b07-b16a-4d65880b37be}" filter=" &quot;fk_pressurecontrol_type&quot; =  2801 " label="Chambre réducteur"/>
          <rule symbol="23" key="{58ca52b5-c570-46bb-a8d6-37620ad6dfdd}" filter=" &quot;fk_pressurecontrol_type&quot; =  2802" label="Chambre coupe pression"/>
          <rule symbol="24" key="{e5d0325a-e0da-4e48-9d56-e1af3d322a7c}" filter=" &quot;fk_pressurecontrol_type&quot; =  2803" label="Chambre de rassemblement"/>
        </rule>
        <rule symbol="25" key="{53d7b7ef-bd10-4993-87fd-3d4573cd83ce}" filter="installation_type = 'pump'" label="pump"/>
        <rule symbol="26" key="{18febfc6-d9a9-4440-bee8-fa580f8b5d76}" filter="installation_type = 'source'" label="source"/>
        <rule symbol="27" key="{006b8eb0-9edd-4fe7-8811-9db931679b5f}" filter="installation_type = 'tank'" label="tank"/>
        <rule symbol="28" key="{d9e91fdc-4236-40c2-9a43-470f8c8503cf}" filter="installation_type = 'treatment'" label="treatment"/>
        <rule symbol="29" key="{502f5a4d-e6dd-456d-9170-febbacdf05b8}" filter="ELSE"/>
      </rule>
      <rule key="{05336f6d-543d-4bf7-bea5-a474d431bdf3}" filter="fk_distributor != 1" label="étranger">
        <rule key="{8beaf9ba-e486-46ce-8f70-957911d5515b}" filter="installation_type = 'chamber'" label="Chambre">
          <rule symbol="30" key="{5f09c1ec-36a2-4dba-98f0-bcd568e24533}" filter="flow_meter= 'true' or water_meter= 'true' or manometer= 'true'" label="Chambre débitmètre"/>
          <rule symbol="31" key="{a6204137-028d-44b7-b245-5d3b24a7d399}" filter="ELSE" label="Chambre"/>
        </rule>
        <rule key="{94454820-5d27-4427-80f6-24d28c5c51a3}" filter="installation_type = 'pressurecontrol'" label="pressurecontrol">
          <rule symbol="32" key="{d2372040-fe4c-4b5f-8432-b8fe2a68d576}" filter=" &quot;fk_pressurecontrol_type&quot; =  2801 " label="Chambre réducteur"/>
          <rule symbol="33" key="{9402cda0-5af5-4a12-8353-366c479faed7}" filter=" &quot;fk_pressurecontrol_type&quot; =  2802" label="Chambre coupe pression"/>
          <rule symbol="34" key="{318b69f6-b284-41b7-aa22-bdf34451d264}" filter=" &quot;fk_pressurecontrol_type&quot; =  2803" label="Chambre de rassemblement"/>
        </rule>
        <rule symbol="35" key="{c43ff5da-3940-4343-ba73-5421a97e3150}" filter="installation_type = 'pump'" label="pump"/>
        <rule symbol="36" key="{79439a36-597f-4775-89a8-7c072e5beef5}" filter="installation_type = 'source'" label="source"/>
        <rule symbol="37" key="{2da4b3f5-47c6-44d2-8e96-2a0b70b6ad15}" filter="installation_type = 'tank'" label="tank"/>
        <rule symbol="38" key="{da2a0958-a57b-43fc-9c43-8725b703dedc}" filter="installation_type = 'treatment'" label="treatment"/>
        <rule symbol="39" key="{95c23bff-05b6-444b-ba53-a19d85aec669}" filter="ELSE"/>
      </rule>
    </rules>
    <symbols>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="0">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/meter.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="255,255,255,255" k="outline_color"/>
          <prop v="1" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="fillColor">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="'[0,0,0]'" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
                <Option type="Map" name="outlineColor">
                  <Option value="true" type="bool" name="active"/>
                  <Option value="'[0,0,0]'" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
              </Option>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="1">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/chamber.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="255,255,255,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="10">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="227,26,28,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/meter.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="1" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="11">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="227,26,28,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/chamber.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="12">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="227,26,28,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/reduction.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="13">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="227,26,28,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/pressurebreak.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="14">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/gathering.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="fillColor">
                  <Option value="false" type="bool" name="active"/>
                  <Option value="'[227,26,0]'" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
                <Option type="Map" name="outlineColor">
                  <Option value="false" type="bool" name="active"/>
                  <Option value="'[227,26,0]'" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
              </Option>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="15">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="227,26,28,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/pump.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="16">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/source.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="17">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="227,26,28,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/tank.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="fillColor">
                  <Option value="false" type="bool" name="active"/>
                  <Option value="@color_inactive" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
                <Option type="Map" name="outlineColor">
                  <Option value="false" type="bool" name="active"/>
                  <Option value="@color_inactive" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
              </Option>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="18">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="227,26,28,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/treatment.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="19">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="238,208,136,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="2" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
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
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/reduction.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="255,255,255,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="20">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="227,26,28,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/meter.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="1" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="21">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="227,26,28,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/chamber.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="22">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="227,26,28,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/reduction.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="23">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="227,26,28,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/pressurebreak.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="24">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/gathering.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="fillColor">
                  <Option value="false" type="bool" name="active"/>
                  <Option value="'[227,26,0]'" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
                <Option type="Map" name="outlineColor">
                  <Option value="false" type="bool" name="active"/>
                  <Option value="'[227,26,0]'" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
              </Option>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="25">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="227,26,28,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/pump.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="26">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/source.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="27">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="227,26,28,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/tank.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="fillColor">
                  <Option value="false" type="bool" name="active"/>
                  <Option value="@color_inactive" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
                <Option type="Map" name="outlineColor">
                  <Option value="false" type="bool" name="active"/>
                  <Option value="@color_inactive" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
              </Option>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="28">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="227,26,28,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/treatment.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="29">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="238,208,136,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="2" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
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
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/pressurebreak.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="255,255,255,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="30">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="40,180,16,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/meter.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="1" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="31">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="40,180,16,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/chamber.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="32">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="227,26,28,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/reduction.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="33">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="227,26,28,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/pressurebreak.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="34">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/gathering.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="fillColor">
                  <Option value="false" type="bool" name="active"/>
                  <Option value="'[227,26,0]'" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
                <Option type="Map" name="outlineColor">
                  <Option value="false" type="bool" name="active"/>
                  <Option value="'[227,26,0]'" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
              </Option>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="35">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="40,180,16,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/pump.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="227,26,28,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="36">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="40,180,16,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/source.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="40,180,16,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="37">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="40,180,16,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/tank.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="40,180,16,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="fillColor">
                  <Option value="false" type="bool" name="active"/>
                  <Option value="@color_inactive" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
                <Option type="Map" name="outlineColor">
                  <Option value="false" type="bool" name="active"/>
                  <Option value="@color_inactive" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
              </Option>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="38">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="40,180,16,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/treatment.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="40,180,16,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="39">
        <layer class="SimpleMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="238,208,136,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="2" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
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
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/gathering.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineColor">
                  <Option value="false" type="bool" name="active"/>
                  <Option value="'[255,100,0]'" type="QString" name="expression"/>
                  <Option value="3" type="int" name="type"/>
                </Option>
              </Option>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" force_rhr="0" alpha="1" type="marker" name="5">
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/pump.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
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
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/source.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
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
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/tank.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="255,255,255,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
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
        <layer class="SvgMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/usr/home/lbartoletti/QWAT/qgis-project/symbols/installations/param_svg/treatment.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
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
        <layer class="SimpleMarker" enabled="1" locked="0" pass="0">
          <prop v="0" k="angle"/>
          <prop v="238,208,136,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="2" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option value="" type="QString" name="name"/>
              <Option name="properties"/>
              <Option value="collection" type="QString" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <labeling type="simple">
    <settings>
      <text-style fontFamily="Sans Serif" useSubstitutions="0" fontUnderline="0" fontItalic="0" fontWordSpacing="0" fontStrikeout="0" fieldName="CASE&#xa;WHEN  &quot;installation_type&quot;  = 'chamber' THEN 'C. '&#xa;WHEN &quot;installation_type&quot;  = 'pressurecontrol' AND fk_pressurecontrol_type = 2801 THEN 'CR. '&#xa;WHEN  &quot;installation_type&quot;  = 'pressurecontrol' AND fk_pressurecontrol_type = 2802 THEN 'CCP. ' &#xa;WHEN  &quot;installation_type&quot;  = 'pressurecontrol' AND fk_pressurecontrol_type = 2803 THEN 'CRA. '&#xa;WHEN  &quot;installation_type&quot;  = 'pump' THEN 'P. ' &#xa;WHEN  &quot;installation_type&quot;  = 'source' THEN 'S. ' &#xa;WHEN  &quot;installation_type&quot;  = 'tank' THEN 'R. '&#xa;WHEN  &quot;installation_type&quot;  = 'treatment' THEN 'T. '&#xa;ELSE '' &#xa;END&#xa;|| coalesce(name, '')" blendMode="0" fontSizeUnit="Point" textOpacity="1" textColor="0,0,0,255" multilineHeight="1" namedStyle="Normal" fontSize="11" isExpression="1" fontWeight="50" previewBkgrdColor="#ffffff" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontLetterSpacing="0" fontCapitals="0">
        <text-buffer bufferOpacity="1" bufferSizeUnits="MM" bufferColor="255,255,255,255" bufferJoinStyle="64" bufferNoFill="0" bufferDraw="1" bufferSize="1" bufferBlendMode="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0"/>
        <background shapeSizeX="0" shapeBorderColor="128,128,128,255" shapeDraw="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetX="0" shapeBorderWidth="0" shapeRadiiY="0" shapeRotation="0" shapeSizeY="0" shapeOpacity="1" shapeSizeUnit="MM" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeType="0" shapeBorderWidthUnit="MM" shapeBlendMode="0" shapeSizeType="0" shapeFillColor="255,255,255,255" shapeRotationType="0" shapeRadiiX="0" shapeSVGFile="" shapeRadiiUnit="MM" shapeOffsetUnit="MM" shapeJoinStyle="64" shapeOffsetY="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0"/>
        <shadow shadowOffsetAngle="135" shadowRadiusAlphaOnly="0" shadowColor="0,0,0,255" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowDraw="0" shadowRadiusUnit="MM" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowUnder="0" shadowOpacity="0.7" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowRadius="1.5" shadowOffsetGlobal="1" shadowScale="100" shadowBlendMode="6"/>
        <substitutions/>
      </text-style>
      <text-format multilineAlign="1" plussign="0" decimals="3" useMaxLineLengthForAutoWrap="1" addDirectionSymbol="0" placeDirectionSymbol="0" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0" rightDirectionSymbol=">" wrapChar="" autoWrapLength="0" formatNumbers="0"/>
      <placement rotationAngle="0" fitInPolygonOnly="0" offsetType="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" offsetUnits="MapUnit" centroidInside="0" quadOffset="4" repeatDistance="0" maxCurvedCharAngleIn="20" yOffset="0" xOffset="0" centroidWhole="0" distMapUnitScale="3x:0,0,0,0,0,0" maxCurvedCharAngleOut="-20" repeatDistanceUnits="MM" distUnits="MM" preserveRotation="1" priority="5" placement="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" placementFlags="10" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" dist="3"/>
      <rendering scaleVisibility="1" obstacleType="0" obstacle="1" upsidedownLabels="0" scaleMax="10000" limitNumLabels="0" displayAll="1" drawLabels="1" maxNumLabels="2000" obstacleFactor="1" fontMaxPixelSize="10000" scaleMin="1" fontLimitPixelSize="0" fontMinPixelSize="3" mergeLines="0" zIndex="0" labelPerPart="0" minFeatureSize="0"/>
      <dd_properties>
        <Option type="Map">
          <Option value="" type="QString" name="name"/>
          <Option type="Map" name="properties">
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
          </Option>
          <Option value="collection" type="QString" name="type"/>
        </Option>
      </dd_properties>
    </settings>
  </labeling>
  <customproperties>
    <property key="dualview/previewExpressions">
      <value>coalesce(identification|| ' ','') || CASE
WHEN  "installation_type"  = 'chamber' THEN 'C. '
WHEN "installation_type"  = 'pressurecontrol' AND fk_pressurecontrol_type = 2801 THEN 'CR. '
WHEN  "installation_type"  = 'pressurecontrol' AND fk_pressurecontrol_type = 2802 THEN 'CCP. '
WHEN  "installation_type"  = 'pressurecontrol' AND fk_pressurecontrol_type = 2803 THEN 'CRA. '
WHEN  "installation_type"  = 'pump' THEN 'P. '
WHEN  "installation_type"  = 'source' THEN 'S. '
WHEN  "installation_type"  = 'tank' THEN 'R. '
WHEN  "installation_type"  = 'treatment' THEN 'T. '
ELSE ''
END
|| coalesce(name,'')</value>
    </property>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Pie" attributeLegend="1">
    <DiagramCategory backgroundAlpha="255" penColor="#000000" maxScaleDenominator="1e+08" height="15" minScaleDenominator="100000" penAlpha="255" opacity="1" sizeType="MM" barWidth="5" scaleDependency="Area" width="15" minimumSize="0" lineSizeScale="3x:0,0,0,0,0,0" diagramOrientation="Up" lineSizeType="MM" sizeScale="3x:0,0,0,0,0,0" rotationOffset="270" labelPlacementMethod="XHeight" enabled="0" scaleBasedVisibility="0" penWidth="0" backgroundColor="#ffffff">
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
            <Option value="false" type="bool" name="OrderByValue"/>
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
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="name" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_printmap">
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
    <field name="_geometry_alt1_used">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_geometry_alt2_used">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_pipe_node_type">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_pipe_orientation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_pipe_schema_visible">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
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
    <field name="fk_folder">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_locationtype">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="AllowMulti"/>
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="locationtype20150922082741813" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
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
    <field name="label_1_visible">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_1_x">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
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
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="label_2_visible">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
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
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="installation_type">
      <editWidget type="ValueMap">
        <config>
          <Option type="Map">
            <Option type="List" name="map">
              <Option type="Map">
                <Option value="chamber" type="QString" name="chambre"/>
              </Option>
              <Option type="Map">
                <Option value="pump" type="QString" name="pompage"/>
              </Option>
              <Option type="Map">
                <Option value="pressurecontrol" type="QString" name="régulation de pression"/>
              </Option>
              <Option type="Map">
                <Option value="tank" type="QString" name="réservoir"/>
              </Option>
              <Option type="Map">
                <Option value="source" type="QString" name="source"/>
              </Option>
              <Option type="Map">
                <Option value="treatment" type="QString" name="traitement"/>
              </Option>
            </Option>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="name">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_parent">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowAddFeatures"/>
            <Option value="true" type="bool" name="AllowNULL"/>
            <Option value="true" type="bool" name="MapIdentification"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="ReadOnly"/>
            <Option value="relation_installation_parent" type="QString" name="Relation"/>
            <Option value="false" type="bool" name="ShowForm"/>
            <Option value="true" type="bool" name="ShowOpenFormButton"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_remote">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="remote_type20130304110004987" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_watertype">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_watertype20131217141603877" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="parcel">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="eca">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="open_water_surface">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="geometry_polygon">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
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
    <field name="flow_meter">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="water_meter">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="manometer">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="depth">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="no_valves">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="999" type="int" name="Max"/>
            <Option value="0" type="int" name="Min"/>
            <Option value="0" type="int" name="Precision"/>
            <Option value="1" type="int" name="Step"/>
            <Option value="SpinBox" type="QString" name="Style"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_pressurecontrol_type">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="pressurecontrol_type20150203100321270" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_pump_type">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_pumptype20130816140237776" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_pipe_in">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowAddFeatures"/>
            <Option value="true" type="bool" name="AllowNULL"/>
            <Option value="true" type="bool" name="MapIdentification"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="true" type="bool" name="ReadOnly"/>
            <Option value="relation_pump_pipe_in" type="QString" name="Relation"/>
            <Option value="false" type="bool" name="ShowForm"/>
            <Option value="true" type="bool" name="ShowOpenFormButton"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_pipe_out">
      <editWidget type="RelationReference">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowAddFeatures"/>
            <Option value="true" type="bool" name="AllowNULL"/>
            <Option value="true" type="bool" name="MapIdentification"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="true" type="bool" name="ReadOnly"/>
            <Option value="relation_pump_pipe_out" type="QString" name="Relation"/>
            <Option value="false" type="bool" name="ShowForm"/>
            <Option value="true" type="bool" name="ShowOpenFormButton"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_pump_operating">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="pump_operating20150922083814587" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="no_pumps">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="99" type="int" name="Max"/>
            <Option value="0" type="int" name="Min"/>
            <Option value="0" type="int" name="Precision"/>
            <Option value="1" type="int" name="Step"/>
            <Option value="SpinBox" type="QString" name="Style"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="rejected_flow">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="manometric_height">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_source_type">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_sourcetype20130820110518791" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_source_quality">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_sourcequality20130820110518810" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="flow_lowest">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="flow_average">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="flow_concession">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="contract_end">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option value="true" type="bool" name="allow_null"/>
            <Option value="true" type="bool" name="calendar_popup"/>
            <Option value="yyyy-MM-dd" type="QString" name="display_format"/>
            <Option value="yyyy-MM-dd" type="QString" name="field_format"/>
            <Option value="false" type="bool" name="field_iso_format"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="gathering_chamber">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_overflow">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_overflow20130304170704046" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fk_tank_firestorage">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="false" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_tank_firestorage20130304170704030" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="storage_total">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="storage_supply">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="storage_fire">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="altitude_overflow">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="altitude_apron">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="height_max">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fire_valve">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fire_remote">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_litrepercm">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="cistern1_fk_type">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_cistern20130304110005061" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="cistern1_dimension_1">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="cistern1_dimension_2">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="cistern1_storage">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_cistern1_litrepercm">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="cistern2_fk_type">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="AllowMulti"/>
            <Option value="true" type="bool" name="AllowNull"/>
            <Option value="" type="QString" name="FilterExpression"/>
            <Option value="id" type="QString" name="Key"/>
            <Option value="vl_cistern20130304110005061" type="QString" name="Layer"/>
            <Option value="1" type="int" name="NofColumns"/>
            <Option value="false" type="bool" name="OrderByValue"/>
            <Option value="false" type="bool" name="UseCompleter"/>
            <Option value="value_fr" type="QString" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="cistern2_dimension_1">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="cistern2_dimension_2">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="cistern2_storage">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_cistern2_litrepercm">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sanitization_uv">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sanitization_chlorine_liquid">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sanitization_chlorine_gas">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sanitization_ozone">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="filtration_membrane">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="filtration_sandorgravel">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="flocculation">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="activatedcharcoal">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="settling">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option value="" type="QString" name="CheckedState"/>
            <Option value="" type="QString" name="UncheckedState"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="treatment_capacity">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="false" type="bool" name="IsMultiline"/>
            <Option value="false" type="bool" name="UseHtml"/>
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
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_installation_type_short">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option value="0" type="QString" name="IsMultiline"/>
            <Option value="0" type="QString" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="id" index="0" name="ID"/>
    <alias field="fk_district" index="1" name=""/>
    <alias field="fk_pressurezone" index="2" name=""/>
    <alias field="fk_printmap" index="3" name=""/>
    <alias field="_printmaps" index="4" name=""/>
    <alias field="_geometry_alt1_used" index="5" name=""/>
    <alias field="_geometry_alt2_used" index="6" name=""/>
    <alias field="_pipe_node_type" index="7" name=""/>
    <alias field="_pipe_orientation" index="8" name=""/>
    <alias field="_pipe_schema_visible" index="9" name=""/>
    <alias field="geometry_alt1" index="10" name=""/>
    <alias field="geometry_alt2" index="11" name=""/>
    <alias field="update_geometry_alt1" index="12" name=""/>
    <alias field="update_geometry_alt2" index="13" name=""/>
    <alias field="identification" index="14" name="Identification"/>
    <alias field="fk_distributor" index="15" name="Distributeur"/>
    <alias field="fk_status" index="16" name="Status"/>
    <alias field="fk_folder" index="17" name=""/>
    <alias field="fk_locationtype" index="18" name="Emplacement"/>
    <alias field="fk_precision" index="19" name="Précision"/>
    <alias field="fk_precisionalti" index="20" name="Précision alti."/>
    <alias field="fk_object_reference" index="21" name="Pt. de réf."/>
    <alias field="altitude" index="22" name="Altitude"/>
    <alias field="year" index="23" name="Année"/>
    <alias field="year_end" index="24" name="Année fin"/>
    <alias field="orientation" index="25" name=""/>
    <alias field="remark" index="26" name="Commentaire"/>
    <alias field="label_1_visible" index="27" name=""/>
    <alias field="label_1_x" index="28" name=""/>
    <alias field="label_1_y" index="29" name=""/>
    <alias field="label_1_rotation" index="30" name=""/>
    <alias field="label_1_text" index="31" name=""/>
    <alias field="label_2_visible" index="32" name=""/>
    <alias field="label_2_x" index="33" name=""/>
    <alias field="label_2_y" index="34" name=""/>
    <alias field="label_2_rotation" index="35" name=""/>
    <alias field="label_2_text" index="36" name=""/>
    <alias field="installation_type" index="37" name="Type"/>
    <alias field="name" index="38" name="Nom"/>
    <alias field="fk_parent" index="39" name="Ouvrage principal"/>
    <alias field="fk_remote" index="40" name="Télécom."/>
    <alias field="fk_watertype" index="41" name="Type d'eau"/>
    <alias field="parcel" index="42" name="Parcelle"/>
    <alias field="eca" index="43" name="ECA"/>
    <alias field="open_water_surface" index="44" name="Eau de surface"/>
    <alias field="geometry_polygon" index="45" name=""/>
    <alias field="networkseparation" index="46" name="séparation de réseau"/>
    <alias field="flow_meter" index="47" name="débitmètre"/>
    <alias field="water_meter" index="48" name="compteur"/>
    <alias field="manometer" index="49" name="manomètre"/>
    <alias field="depth" index="50" name="profondeur"/>
    <alias field="no_valves" index="51" name="nb. vannes"/>
    <alias field="fk_pressurecontrol_type" index="52" name="type"/>
    <alias field="fk_pump_type" index="53" name="type"/>
    <alias field="fk_pipe_in" index="54" name="conduite entrée"/>
    <alias field="fk_pipe_out" index="55" name="conduite sortie"/>
    <alias field="fk_pump_operating" index="56" name="mode"/>
    <alias field="no_pumps" index="57" name="nb. pompes"/>
    <alias field="rejected_flow" index="58" name="débit refoulé"/>
    <alias field="manometric_height" index="59" name="hauteur mano."/>
    <alias field="fk_source_type" index="60" name="type"/>
    <alias field="fk_source_quality" index="61" name="qualité"/>
    <alias field="flow_lowest" index="62" name="débit étiage"/>
    <alias field="flow_average" index="63" name="débit moyen"/>
    <alias field="flow_concession" index="64" name="débit concession"/>
    <alias field="contract_end" index="65" name="fin contrat"/>
    <alias field="gathering_chamber" index="66" name="chambre de rassemblement"/>
    <alias field="fk_overflow" index="67" name="Trop-plein"/>
    <alias field="fk_tank_firestorage" index="68" name="Type rés. incendie"/>
    <alias field="storage_total" index="69" name="Réserve totale"/>
    <alias field="storage_supply" index="70" name="Rés. utile"/>
    <alias field="storage_fire" index="71" name="Rés. incendie"/>
    <alias field="altitude_overflow" index="72" name="Alt. trop-plein"/>
    <alias field="altitude_apron" index="73" name="Alt. radier"/>
    <alias field="height_max" index="74" name="Hauteur max."/>
    <alias field="fire_valve" index="75" name="Vanne incendie"/>
    <alias field="fire_remote" index="76" name="Télécommande incendie"/>
    <alias field="_litrepercm" index="77" name="Litres/cm"/>
    <alias field="cistern1_fk_type" index="78" name="Type"/>
    <alias field="cistern1_dimension_1" index="79" name="Diamètre/largeur"/>
    <alias field="cistern1_dimension_2" index="80" name="Longueur"/>
    <alias field="cistern1_storage" index="81" name="Volume"/>
    <alias field="_cistern1_litrepercm" index="82" name="Litres/cm"/>
    <alias field="cistern2_fk_type" index="83" name="Type"/>
    <alias field="cistern2_dimension_1" index="84" name="Diamètre/largeur"/>
    <alias field="cistern2_dimension_2" index="85" name="Longueur"/>
    <alias field="cistern2_storage" index="86" name="Volume"/>
    <alias field="_cistern2_litrepercm" index="87" name="Litres/cm"/>
    <alias field="sanitization_uv" index="88" name="désinfection UV"/>
    <alias field="sanitization_chlorine_liquid" index="89" name="désinfection chlore liquide"/>
    <alias field="sanitization_chlorine_gas" index="90" name="désinfection chlore gazeaux"/>
    <alias field="sanitization_ozone" index="91" name="désinfection ozone"/>
    <alias field="filtration_membrane" index="92" name="filtration membranaire"/>
    <alias field="filtration_sandorgravel" index="93" name="filtration à sable"/>
    <alias field="flocculation" index="94" name="flocculation"/>
    <alias field="activatedcharcoal" index="95" name="charbon actif"/>
    <alias field="settling" index="96" name="décantation"/>
    <alias field="treatment_capacity" index="97" name="capacité"/>
    <alias field="status_active" index="98" name=""/>
    <alias field="status_functional" index="99" name=""/>
    <alias field="_installation_type_short" index="100" name=""/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="id" expression="" applyOnUpdate="0"/>
    <default field="fk_district" expression="" applyOnUpdate="0"/>
    <default field="fk_pressurezone" expression="" applyOnUpdate="0"/>
    <default field="fk_printmap" expression="" applyOnUpdate="0"/>
    <default field="_printmaps" expression="" applyOnUpdate="0"/>
    <default field="_geometry_alt1_used" expression="" applyOnUpdate="0"/>
    <default field="_geometry_alt2_used" expression="" applyOnUpdate="0"/>
    <default field="_pipe_node_type" expression="" applyOnUpdate="0"/>
    <default field="_pipe_orientation" expression="" applyOnUpdate="0"/>
    <default field="_pipe_schema_visible" expression="" applyOnUpdate="0"/>
    <default field="geometry_alt1" expression="" applyOnUpdate="0"/>
    <default field="geometry_alt2" expression="" applyOnUpdate="0"/>
    <default field="update_geometry_alt1" expression="" applyOnUpdate="0"/>
    <default field="update_geometry_alt2" expression="" applyOnUpdate="0"/>
    <default field="identification" expression="" applyOnUpdate="0"/>
    <default field="fk_distributor" expression="" applyOnUpdate="0"/>
    <default field="fk_status" expression="" applyOnUpdate="0"/>
    <default field="fk_folder" expression="" applyOnUpdate="0"/>
    <default field="fk_locationtype" expression="" applyOnUpdate="0"/>
    <default field="fk_precision" expression="" applyOnUpdate="0"/>
    <default field="fk_precisionalti" expression="" applyOnUpdate="0"/>
    <default field="fk_object_reference" expression="" applyOnUpdate="0"/>
    <default field="altitude" expression="" applyOnUpdate="0"/>
    <default field="year" expression="" applyOnUpdate="0"/>
    <default field="year_end" expression="" applyOnUpdate="0"/>
    <default field="orientation" expression="" applyOnUpdate="0"/>
    <default field="remark" expression="" applyOnUpdate="0"/>
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
    <default field="installation_type" expression="" applyOnUpdate="0"/>
    <default field="name" expression="" applyOnUpdate="0"/>
    <default field="fk_parent" expression="" applyOnUpdate="0"/>
    <default field="fk_remote" expression="" applyOnUpdate="0"/>
    <default field="fk_watertype" expression="" applyOnUpdate="0"/>
    <default field="parcel" expression="" applyOnUpdate="0"/>
    <default field="eca" expression="" applyOnUpdate="0"/>
    <default field="open_water_surface" expression="" applyOnUpdate="0"/>
    <default field="geometry_polygon" expression="" applyOnUpdate="0"/>
    <default field="networkseparation" expression="" applyOnUpdate="0"/>
    <default field="flow_meter" expression="" applyOnUpdate="0"/>
    <default field="water_meter" expression="" applyOnUpdate="0"/>
    <default field="manometer" expression="" applyOnUpdate="0"/>
    <default field="depth" expression="" applyOnUpdate="0"/>
    <default field="no_valves" expression="" applyOnUpdate="0"/>
    <default field="fk_pressurecontrol_type" expression="" applyOnUpdate="0"/>
    <default field="fk_pump_type" expression="" applyOnUpdate="0"/>
    <default field="fk_pipe_in" expression="" applyOnUpdate="0"/>
    <default field="fk_pipe_out" expression="" applyOnUpdate="0"/>
    <default field="fk_pump_operating" expression="" applyOnUpdate="0"/>
    <default field="no_pumps" expression="" applyOnUpdate="0"/>
    <default field="rejected_flow" expression="" applyOnUpdate="0"/>
    <default field="manometric_height" expression="" applyOnUpdate="0"/>
    <default field="fk_source_type" expression="" applyOnUpdate="0"/>
    <default field="fk_source_quality" expression="" applyOnUpdate="0"/>
    <default field="flow_lowest" expression="" applyOnUpdate="0"/>
    <default field="flow_average" expression="" applyOnUpdate="0"/>
    <default field="flow_concession" expression="" applyOnUpdate="0"/>
    <default field="contract_end" expression="" applyOnUpdate="0"/>
    <default field="gathering_chamber" expression="" applyOnUpdate="0"/>
    <default field="fk_overflow" expression="" applyOnUpdate="0"/>
    <default field="fk_tank_firestorage" expression="" applyOnUpdate="0"/>
    <default field="storage_total" expression="" applyOnUpdate="0"/>
    <default field="storage_supply" expression="" applyOnUpdate="0"/>
    <default field="storage_fire" expression="" applyOnUpdate="0"/>
    <default field="altitude_overflow" expression="" applyOnUpdate="0"/>
    <default field="altitude_apron" expression="" applyOnUpdate="0"/>
    <default field="height_max" expression="" applyOnUpdate="0"/>
    <default field="fire_valve" expression="" applyOnUpdate="0"/>
    <default field="fire_remote" expression="" applyOnUpdate="0"/>
    <default field="_litrepercm" expression="" applyOnUpdate="0"/>
    <default field="cistern1_fk_type" expression="" applyOnUpdate="0"/>
    <default field="cistern1_dimension_1" expression="" applyOnUpdate="0"/>
    <default field="cistern1_dimension_2" expression="" applyOnUpdate="0"/>
    <default field="cistern1_storage" expression="" applyOnUpdate="0"/>
    <default field="_cistern1_litrepercm" expression="" applyOnUpdate="0"/>
    <default field="cistern2_fk_type" expression="" applyOnUpdate="0"/>
    <default field="cistern2_dimension_1" expression="" applyOnUpdate="0"/>
    <default field="cistern2_dimension_2" expression="" applyOnUpdate="0"/>
    <default field="cistern2_storage" expression="" applyOnUpdate="0"/>
    <default field="_cistern2_litrepercm" expression="" applyOnUpdate="0"/>
    <default field="sanitization_uv" expression="" applyOnUpdate="0"/>
    <default field="sanitization_chlorine_liquid" expression="" applyOnUpdate="0"/>
    <default field="sanitization_chlorine_gas" expression="" applyOnUpdate="0"/>
    <default field="sanitization_ozone" expression="" applyOnUpdate="0"/>
    <default field="filtration_membrane" expression="" applyOnUpdate="0"/>
    <default field="filtration_sandorgravel" expression="" applyOnUpdate="0"/>
    <default field="flocculation" expression="" applyOnUpdate="0"/>
    <default field="activatedcharcoal" expression="" applyOnUpdate="0"/>
    <default field="settling" expression="" applyOnUpdate="0"/>
    <default field="treatment_capacity" expression="" applyOnUpdate="0"/>
    <default field="status_active" expression="" applyOnUpdate="0"/>
    <default field="status_functional" expression="" applyOnUpdate="0"/>
    <default field="_installation_type_short" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint field="id" notnull_strength="1" unique_strength="1" exp_strength="0" constraints="3"/>
    <constraint field="fk_district" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_pressurezone" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_printmap" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="_printmaps" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="_geometry_alt1_used" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="_geometry_alt2_used" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="_pipe_node_type" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="_pipe_orientation" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="_pipe_schema_visible" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="geometry_alt1" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="geometry_alt2" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="update_geometry_alt1" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="update_geometry_alt2" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="identification" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_distributor" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_status" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_folder" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_locationtype" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_precision" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_precisionalti" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_object_reference" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="altitude" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="year" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="year_end" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="orientation" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="remark" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
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
    <constraint field="installation_type" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="name" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_parent" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_remote" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_watertype" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="parcel" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="eca" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="open_water_surface" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="geometry_polygon" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="networkseparation" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="flow_meter" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="water_meter" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="manometer" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="depth" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="no_valves" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_pressurecontrol_type" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_pump_type" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_pipe_in" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_pipe_out" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_pump_operating" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="no_pumps" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="rejected_flow" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="manometric_height" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_source_type" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_source_quality" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="flow_lowest" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="flow_average" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="flow_concession" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="contract_end" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="gathering_chamber" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_overflow" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fk_tank_firestorage" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="storage_total" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="storage_supply" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="storage_fire" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="altitude_overflow" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="altitude_apron" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="height_max" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fire_valve" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="fire_remote" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="_litrepercm" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="cistern1_fk_type" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="cistern1_dimension_1" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="cistern1_dimension_2" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="cistern1_storage" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="_cistern1_litrepercm" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="cistern2_fk_type" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="cistern2_dimension_1" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="cistern2_dimension_2" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="cistern2_storage" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="_cistern2_litrepercm" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="sanitization_uv" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="sanitization_chlorine_liquid" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="sanitization_chlorine_gas" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="sanitization_ozone" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="filtration_membrane" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="filtration_sandorgravel" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="flocculation" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="activatedcharcoal" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="settling" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="treatment_capacity" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="status_active" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="status_functional" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
    <constraint field="_installation_type_short" notnull_strength="0" unique_strength="0" exp_strength="0" constraints="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="id" exp="" desc=""/>
    <constraint field="fk_district" exp="" desc=""/>
    <constraint field="fk_pressurezone" exp="" desc=""/>
    <constraint field="fk_printmap" exp="" desc=""/>
    <constraint field="_printmaps" exp="" desc=""/>
    <constraint field="_geometry_alt1_used" exp="" desc=""/>
    <constraint field="_geometry_alt2_used" exp="" desc=""/>
    <constraint field="_pipe_node_type" exp="" desc=""/>
    <constraint field="_pipe_orientation" exp="" desc=""/>
    <constraint field="_pipe_schema_visible" exp="" desc=""/>
    <constraint field="geometry_alt1" exp="" desc=""/>
    <constraint field="geometry_alt2" exp="" desc=""/>
    <constraint field="update_geometry_alt1" exp="" desc=""/>
    <constraint field="update_geometry_alt2" exp="" desc=""/>
    <constraint field="identification" exp="" desc=""/>
    <constraint field="fk_distributor" exp="" desc=""/>
    <constraint field="fk_status" exp="" desc=""/>
    <constraint field="fk_folder" exp="" desc=""/>
    <constraint field="fk_locationtype" exp="" desc=""/>
    <constraint field="fk_precision" exp="" desc=""/>
    <constraint field="fk_precisionalti" exp="" desc=""/>
    <constraint field="fk_object_reference" exp="" desc=""/>
    <constraint field="altitude" exp="" desc=""/>
    <constraint field="year" exp="" desc=""/>
    <constraint field="year_end" exp="" desc=""/>
    <constraint field="orientation" exp="" desc=""/>
    <constraint field="remark" exp="" desc=""/>
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
    <constraint field="installation_type" exp="" desc=""/>
    <constraint field="name" exp="" desc=""/>
    <constraint field="fk_parent" exp="" desc=""/>
    <constraint field="fk_remote" exp="" desc=""/>
    <constraint field="fk_watertype" exp="" desc=""/>
    <constraint field="parcel" exp="" desc=""/>
    <constraint field="eca" exp="" desc=""/>
    <constraint field="open_water_surface" exp="" desc=""/>
    <constraint field="geometry_polygon" exp="" desc=""/>
    <constraint field="networkseparation" exp="" desc=""/>
    <constraint field="flow_meter" exp="" desc=""/>
    <constraint field="water_meter" exp="" desc=""/>
    <constraint field="manometer" exp="" desc=""/>
    <constraint field="depth" exp="" desc=""/>
    <constraint field="no_valves" exp="" desc=""/>
    <constraint field="fk_pressurecontrol_type" exp="" desc=""/>
    <constraint field="fk_pump_type" exp="" desc=""/>
    <constraint field="fk_pipe_in" exp="" desc=""/>
    <constraint field="fk_pipe_out" exp="" desc=""/>
    <constraint field="fk_pump_operating" exp="" desc=""/>
    <constraint field="no_pumps" exp="" desc=""/>
    <constraint field="rejected_flow" exp="" desc=""/>
    <constraint field="manometric_height" exp="" desc=""/>
    <constraint field="fk_source_type" exp="" desc=""/>
    <constraint field="fk_source_quality" exp="" desc=""/>
    <constraint field="flow_lowest" exp="" desc=""/>
    <constraint field="flow_average" exp="" desc=""/>
    <constraint field="flow_concession" exp="" desc=""/>
    <constraint field="contract_end" exp="" desc=""/>
    <constraint field="gathering_chamber" exp="" desc=""/>
    <constraint field="fk_overflow" exp="" desc=""/>
    <constraint field="fk_tank_firestorage" exp="" desc=""/>
    <constraint field="storage_total" exp="" desc=""/>
    <constraint field="storage_supply" exp="" desc=""/>
    <constraint field="storage_fire" exp="" desc=""/>
    <constraint field="altitude_overflow" exp="" desc=""/>
    <constraint field="altitude_apron" exp="" desc=""/>
    <constraint field="height_max" exp="" desc=""/>
    <constraint field="fire_valve" exp="" desc=""/>
    <constraint field="fire_remote" exp="" desc=""/>
    <constraint field="_litrepercm" exp="" desc=""/>
    <constraint field="cistern1_fk_type" exp="" desc=""/>
    <constraint field="cistern1_dimension_1" exp="" desc=""/>
    <constraint field="cistern1_dimension_2" exp="" desc=""/>
    <constraint field="cistern1_storage" exp="" desc=""/>
    <constraint field="_cistern1_litrepercm" exp="" desc=""/>
    <constraint field="cistern2_fk_type" exp="" desc=""/>
    <constraint field="cistern2_dimension_1" exp="" desc=""/>
    <constraint field="cistern2_dimension_2" exp="" desc=""/>
    <constraint field="cistern2_storage" exp="" desc=""/>
    <constraint field="_cistern2_litrepercm" exp="" desc=""/>
    <constraint field="sanitization_uv" exp="" desc=""/>
    <constraint field="sanitization_chlorine_liquid" exp="" desc=""/>
    <constraint field="sanitization_chlorine_gas" exp="" desc=""/>
    <constraint field="sanitization_ozone" exp="" desc=""/>
    <constraint field="filtration_membrane" exp="" desc=""/>
    <constraint field="filtration_sandorgravel" exp="" desc=""/>
    <constraint field="flocculation" exp="" desc=""/>
    <constraint field="activatedcharcoal" exp="" desc=""/>
    <constraint field="settling" exp="" desc=""/>
    <constraint field="treatment_capacity" exp="" desc=""/>
    <constraint field="status_active" exp="" desc=""/>
    <constraint field="status_functional" exp="" desc=""/>
    <constraint field="_installation_type_short" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields>
    <field comment="" typeName="int2" type="2" expression="CASE WHEN  &quot;installation_type&quot; = 'chamber' THEN 'C.'&#xa; WHEN  &quot;installation_type&quot; =  'pressurecontrol'  AND  &quot;fk_pressurecontrol_type&quot; = 2801 THEN 'CR.'&#xa; WHEN  &quot;installation_type&quot; =  'pressurecontrol'  AND  &quot;fk_pressurecontrol_type&quot; = 2802 THEN 'CCP.'&#xa; WHEN  &quot;installation_type&quot; =  'pressurecontrol'  AND  &quot;fk_pressurecontrol_type&quot; = 2803 THEN 'CRA.'&#xa; WHEN  &quot;installation_type&quot; =  'pump'  THEN 'P.'&#xa; WHEN  &quot;installation_type&quot; =  'source'  THEN 'S.'&#xa; WHEN  &quot;installation_type&quot; =  'tank'  THEN 'R.'&#xa; WHEN  &quot;installation_type&quot; =  'treatment'  THEN 'T.'&#xa;ELSE ''&#xa;END" name="_installation_type_short" subType="0" length="-1" precision="0"/>
  </expressionfields>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column hidden="0" type="field" name="id" width="-1"/>
      <column hidden="0" type="field" name="fk_district" width="-1"/>
      <column hidden="0" type="field" name="fk_pressurezone" width="-1"/>
      <column hidden="0" type="field" name="fk_printmap" width="-1"/>
      <column hidden="0" type="field" name="_printmaps" width="-1"/>
      <column hidden="0" type="field" name="_geometry_alt1_used" width="-1"/>
      <column hidden="0" type="field" name="_geometry_alt2_used" width="-1"/>
      <column hidden="0" type="field" name="_pipe_node_type" width="-1"/>
      <column hidden="0" type="field" name="_pipe_orientation" width="-1"/>
      <column hidden="0" type="field" name="_pipe_schema_visible" width="-1"/>
      <column hidden="0" type="field" name="geometry_alt1" width="-1"/>
      <column hidden="0" type="field" name="geometry_alt2" width="-1"/>
      <column hidden="0" type="field" name="update_geometry_alt1" width="-1"/>
      <column hidden="0" type="field" name="update_geometry_alt2" width="-1"/>
      <column hidden="0" type="field" name="identification" width="-1"/>
      <column hidden="0" type="field" name="fk_distributor" width="-1"/>
      <column hidden="0" type="field" name="fk_status" width="-1"/>
      <column hidden="0" type="field" name="fk_folder" width="-1"/>
      <column hidden="0" type="field" name="fk_locationtype" width="-1"/>
      <column hidden="0" type="field" name="year" width="-1"/>
      <column hidden="0" type="field" name="year_end" width="-1"/>
      <column hidden="0" type="field" name="remark" width="-1"/>
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
      <column hidden="0" type="field" name="fk_precision" width="-1"/>
      <column hidden="0" type="field" name="fk_precisionalti" width="-1"/>
      <column hidden="0" type="field" name="fk_object_reference" width="-1"/>
      <column hidden="0" type="field" name="altitude" width="-1"/>
      <column hidden="0" type="field" name="orientation" width="-1"/>
      <column hidden="0" type="field" name="installation_type" width="-1"/>
      <column hidden="0" type="field" name="name" width="-1"/>
      <column hidden="0" type="field" name="fk_parent" width="-1"/>
      <column hidden="0" type="field" name="fk_remote" width="-1"/>
      <column hidden="0" type="field" name="fk_watertype" width="-1"/>
      <column hidden="0" type="field" name="parcel" width="-1"/>
      <column hidden="0" type="field" name="eca" width="-1"/>
      <column hidden="0" type="field" name="open_water_surface" width="-1"/>
      <column hidden="0" type="field" name="geometry_polygon" width="-1"/>
      <column hidden="0" type="field" name="fk_source_type" width="-1"/>
      <column hidden="0" type="field" name="fk_source_quality" width="-1"/>
      <column hidden="0" type="field" name="flow_lowest" width="-1"/>
      <column hidden="0" type="field" name="flow_average" width="-1"/>
      <column hidden="0" type="field" name="flow_concession" width="-1"/>
      <column hidden="0" type="field" name="contract_end" width="-1"/>
      <column hidden="0" type="field" name="gathering_chamber" width="-1"/>
      <column hidden="0" type="field" name="fk_pump_type" width="-1"/>
      <column hidden="0" type="field" name="fk_pipe_in" width="-1"/>
      <column hidden="0" type="field" name="fk_pipe_out" width="-1"/>
      <column hidden="0" type="field" name="fk_pump_operating" width="-1"/>
      <column hidden="0" type="field" name="no_pumps" width="-1"/>
      <column hidden="0" type="field" name="rejected_flow" width="-1"/>
      <column hidden="0" type="field" name="manometric_height" width="-1"/>
      <column hidden="0" type="field" name="fk_overflow" width="-1"/>
      <column hidden="0" type="field" name="fk_tank_firestorage" width="-1"/>
      <column hidden="0" type="field" name="storage_total" width="-1"/>
      <column hidden="0" type="field" name="storage_supply" width="-1"/>
      <column hidden="0" type="field" name="storage_fire" width="-1"/>
      <column hidden="0" type="field" name="altitude_overflow" width="-1"/>
      <column hidden="0" type="field" name="altitude_apron" width="-1"/>
      <column hidden="0" type="field" name="height_max" width="-1"/>
      <column hidden="0" type="field" name="fire_valve" width="-1"/>
      <column hidden="0" type="field" name="fire_remote" width="-1"/>
      <column hidden="0" type="field" name="_litrepercm" width="-1"/>
      <column hidden="0" type="field" name="cistern1_fk_type" width="-1"/>
      <column hidden="0" type="field" name="cistern1_dimension_1" width="-1"/>
      <column hidden="0" type="field" name="cistern1_dimension_2" width="-1"/>
      <column hidden="0" type="field" name="cistern1_storage" width="-1"/>
      <column hidden="0" type="field" name="_cistern1_litrepercm" width="-1"/>
      <column hidden="0" type="field" name="cistern2_fk_type" width="-1"/>
      <column hidden="0" type="field" name="cistern2_dimension_1" width="-1"/>
      <column hidden="0" type="field" name="cistern2_dimension_2" width="-1"/>
      <column hidden="0" type="field" name="cistern2_storage" width="-1"/>
      <column hidden="0" type="field" name="_cistern2_litrepercm" width="-1"/>
      <column hidden="0" type="field" name="sanitization_uv" width="-1"/>
      <column hidden="0" type="field" name="sanitization_chlorine_liquid" width="-1"/>
      <column hidden="0" type="field" name="sanitization_ozone" width="-1"/>
      <column hidden="0" type="field" name="filtration_membrane" width="-1"/>
      <column hidden="0" type="field" name="filtration_sandorgravel" width="-1"/>
      <column hidden="0" type="field" name="flocculation" width="-1"/>
      <column hidden="0" type="field" name="activatedcharcoal" width="-1"/>
      <column hidden="0" type="field" name="settling" width="-1"/>
      <column hidden="0" type="field" name="treatment_capacity" width="-1"/>
      <column hidden="0" type="field" name="networkseparation" width="-1"/>
      <column hidden="0" type="field" name="flow_meter" width="-1"/>
      <column hidden="0" type="field" name="water_meter" width="-1"/>
      <column hidden="0" type="field" name="manometer" width="-1"/>
      <column hidden="0" type="field" name="depth" width="-1"/>
      <column hidden="0" type="field" name="no_valves" width="-1"/>
      <column hidden="0" type="field" name="fk_pressurecontrol_type" width="-1"/>
      <column hidden="0" type="field" name="status_active" width="-1"/>
      <column hidden="0" type="field" name="status_functional" width="-1"/>
      <column hidden="0" type="field" name="_installation_type_short" width="-1"/>
      <column hidden="1" type="actions" width="-1"/>
      <column hidden="0" type="field" name="sanitization_chlorine_gas" width="-1"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1">/home/lbartoletti/QWAT/qgis-project/ui_forms/installation.ui</editform>
  <editforminit>formOpen</editforminit>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath>/home/lbartoletti/QWAT/qgis-project/python/installation_form.py</editforminitfilepath>
  <editforminitcode><![CDATA[from python.installation_form import formOpen
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" groupBox="0" name="Général" showLabel="1">
      <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" groupBox="1" name="" showLabel="0">
        <attributeEditorField index="0" name="id" showLabel="1"/>
        <attributeEditorField index="37" name="installation_type" showLabel="1"/>
        <attributeEditorField index="38" name="name" showLabel="1"/>
        <attributeEditorField index="14" name="identification" showLabel="1"/>
        <attributeEditorField index="39" name="fk_parent" showLabel="1"/>
        <attributeEditorField index="43" name="eca" showLabel="1"/>
        <attributeEditorField index="16" name="fk_status" showLabel="1"/>
        <attributeEditorField index="42" name="parcel" showLabel="1"/>
        <attributeEditorField index="15" name="fk_distributor" showLabel="1"/>
        <attributeEditorField index="22" name="altitude" showLabel="1"/>
        <attributeEditorField index="23" name="year" showLabel="1"/>
        <attributeEditorField index="19" name="fk_precision" showLabel="1"/>
        <attributeEditorField index="24" name="year_end" showLabel="1"/>
        <attributeEditorField index="20" name="fk_precisionalti" showLabel="1"/>
        <attributeEditorField index="41" name="fk_watertype" showLabel="1"/>
        <attributeEditorField index="21" name="fk_object_reference" showLabel="1"/>
        <attributeEditorField index="40" name="fk_remote" showLabel="1"/>
        <attributeEditorField index="44" name="open_water_surface" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="1" columnCount="1" visibilityExpression=" &quot;installation_type&quot; = 'chamber' " groupBox="1" name="Chambre" showLabel="1">
        <attributeEditorField index="46" name="networkseparation" showLabel="1"/>
        <attributeEditorField index="47" name="flow_meter" showLabel="1"/>
        <attributeEditorField index="48" name="water_meter" showLabel="1"/>
        <attributeEditorField index="49" name="manometer" showLabel="1"/>
        <attributeEditorField index="50" name="depth" showLabel="1"/>
        <attributeEditorField index="51" name="no_valves" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="1" columnCount="1" visibilityExpression=" &quot;installation_type&quot; = 'pressurecontrol' " groupBox="1" name="Régulation de pression" showLabel="1">
        <attributeEditorField index="52" name="fk_pressurecontrol_type" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="1" columnCount="1" visibilityExpression=" &quot;installation_type&quot; = 'pump' " groupBox="1" name="Pompage" showLabel="1">
        <attributeEditorField index="53" name="fk_pump_type" showLabel="1"/>
        <attributeEditorField index="56" name="fk_pump_operating" showLabel="1"/>
        <attributeEditorField index="57" name="no_pumps" showLabel="1"/>
        <attributeEditorField index="58" name="rejected_flow" showLabel="1"/>
        <attributeEditorField index="59" name="manometric_height" showLabel="1"/>
        <attributeEditorField index="54" name="fk_pipe_in" showLabel="1"/>
        <attributeEditorField index="55" name="fk_pipe_out" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="1" columnCount="1" visibilityExpression=" &quot;installation_type&quot; = 'source' " groupBox="1" name="Source" showLabel="1">
        <attributeEditorField index="60" name="fk_source_type" showLabel="1"/>
        <attributeEditorField index="61" name="fk_source_quality" showLabel="1"/>
        <attributeEditorField index="62" name="flow_lowest" showLabel="1"/>
        <attributeEditorField index="63" name="flow_average" showLabel="1"/>
        <attributeEditorField index="64" name="flow_concession" showLabel="1"/>
        <attributeEditorField index="65" name="contract_end" showLabel="1"/>
        <attributeEditorField index="66" name="gathering_chamber" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="1" columnCount="2" visibilityExpression=" &quot;installation_type&quot; = 'treatment' " groupBox="1" name="Traitement" showLabel="1">
        <attributeEditorField index="88" name="sanitization_uv" showLabel="1"/>
        <attributeEditorField index="92" name="filtration_membrane" showLabel="1"/>
        <attributeEditorField index="89" name="sanitization_chlorine_liquid" showLabel="1"/>
        <attributeEditorField index="93" name="filtration_sandorgravel" showLabel="1"/>
        <attributeEditorField index="90" name="sanitization_chlorine_gas" showLabel="1"/>
        <attributeEditorField index="94" name="flocculation" showLabel="1"/>
        <attributeEditorField index="91" name="sanitization_ozone" showLabel="1"/>
        <attributeEditorField index="95" name="activatedcharcoal" showLabel="1"/>
        <attributeEditorField index="96" name="settling" showLabel="1"/>
        <attributeEditorField index="97" name="treatment_capacity" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="1" columnCount="2" visibilityExpression=" &quot;installation_type&quot; = 'tank' " groupBox="1" name="Réservoir" showLabel="1">
        <attributeEditorField index="69" name="storage_total" showLabel="1"/>
        <attributeEditorField index="70" name="storage_supply" showLabel="1"/>
        <attributeEditorField index="77" name="_litrepercm" showLabel="1"/>
        <attributeEditorField index="71" name="storage_fire" showLabel="1"/>
        <attributeEditorField index="67" name="fk_overflow" showLabel="1"/>
        <attributeEditorField index="68" name="fk_tank_firestorage" showLabel="1"/>
        <attributeEditorField index="72" name="altitude_overflow" showLabel="1"/>
        <attributeEditorField index="75" name="fire_valve" showLabel="1"/>
        <attributeEditorField index="73" name="altitude_apron" showLabel="1"/>
        <attributeEditorField index="76" name="fire_remote" showLabel="1"/>
        <attributeEditorField index="74" name="height_max" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="1" columnCount="2" visibilityExpression=" &quot;installation_type&quot; = 'tank' " groupBox="1" name="Cuves" showLabel="1">
        <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" groupBox="1" name="Cuve 1" showLabel="1">
          <attributeEditorField index="78" name="cistern1_fk_type" showLabel="1"/>
          <attributeEditorField index="79" name="cistern1_dimension_1" showLabel="1"/>
          <attributeEditorField index="80" name="cistern1_dimension_2" showLabel="1"/>
          <attributeEditorField index="81" name="cistern1_storage" showLabel="1"/>
          <attributeEditorField index="82" name="_cistern1_litrepercm" showLabel="1"/>
        </attributeEditorContainer>
        <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" groupBox="1" name="Cuve 2" showLabel="1">
          <attributeEditorField index="83" name="cistern2_fk_type" showLabel="1"/>
          <attributeEditorField index="84" name="cistern2_dimension_1" showLabel="1"/>
          <attributeEditorField index="85" name="cistern2_dimension_2" showLabel="1"/>
          <attributeEditorField index="86" name="cistern2_storage" showLabel="1"/>
          <attributeEditorField index="87" name="_cistern2_litrepercm" showLabel="1"/>
        </attributeEditorContainer>
      </attributeEditorContainer>
      <attributeEditorField index="26" name="remark" showLabel="0"/>
    </attributeEditorContainer>
    <attributeEditorContainer visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" groupBox="0" name="Emplacement" showLabel="1">
      <attributeEditorField index="18" name="fk_locationtype" showLabel="0"/>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field name="_cistern1_litrepercm" editable="1"/>
    <field name="_cistern2_litrepercm" editable="1"/>
    <field name="_geometry_alt1_used" editable="1"/>
    <field name="_geometry_alt2_used" editable="1"/>
    <field name="_installation_type_short" editable="0"/>
    <field name="_litrepercm" editable="1"/>
    <field name="_pipe_node_type" editable="1"/>
    <field name="_pipe_orientation" editable="1"/>
    <field name="_pipe_schema_visible" editable="1"/>
    <field name="_printmaps" editable="1"/>
    <field name="activatedcharcoal" editable="1"/>
    <field name="altitude" editable="1"/>
    <field name="altitude_apron" editable="1"/>
    <field name="altitude_overflow" editable="1"/>
    <field name="cistern1_dimension_1" editable="1"/>
    <field name="cistern1_dimension_2" editable="1"/>
    <field name="cistern1_fk_type" editable="1"/>
    <field name="cistern1_storage" editable="1"/>
    <field name="cistern2_dimension_1" editable="1"/>
    <field name="cistern2_dimension_2" editable="1"/>
    <field name="cistern2_fk_type" editable="1"/>
    <field name="cistern2_storage" editable="1"/>
    <field name="contract_end" editable="1"/>
    <field name="depth" editable="1"/>
    <field name="eca" editable="1"/>
    <field name="filtration_membrane" editable="1"/>
    <field name="filtration_sandorgravel" editable="1"/>
    <field name="fire_remote" editable="1"/>
    <field name="fire_valve" editable="1"/>
    <field name="fk_distributor" editable="1"/>
    <field name="fk_district" editable="1"/>
    <field name="fk_folder" editable="1"/>
    <field name="fk_locationtype" editable="1"/>
    <field name="fk_object_reference" editable="1"/>
    <field name="fk_overflow" editable="1"/>
    <field name="fk_parent" editable="1"/>
    <field name="fk_pipe_in" editable="1"/>
    <field name="fk_pipe_out" editable="1"/>
    <field name="fk_precision" editable="1"/>
    <field name="fk_precisionalti" editable="1"/>
    <field name="fk_pressurecontrol_type" editable="1"/>
    <field name="fk_pressurezone" editable="1"/>
    <field name="fk_printmap" editable="1"/>
    <field name="fk_pump_operating" editable="1"/>
    <field name="fk_pump_type" editable="1"/>
    <field name="fk_remote" editable="1"/>
    <field name="fk_source_quality" editable="1"/>
    <field name="fk_source_type" editable="1"/>
    <field name="fk_status" editable="1"/>
    <field name="fk_tank_firestorage" editable="1"/>
    <field name="fk_watertype" editable="1"/>
    <field name="flocculation" editable="1"/>
    <field name="flow_average" editable="1"/>
    <field name="flow_concession" editable="1"/>
    <field name="flow_lowest" editable="1"/>
    <field name="flow_meter" editable="1"/>
    <field name="gathering_chamber" editable="1"/>
    <field name="geometry_alt1" editable="1"/>
    <field name="geometry_alt2" editable="1"/>
    <field name="geometry_polygon" editable="1"/>
    <field name="height_max" editable="1"/>
    <field name="id" editable="1"/>
    <field name="identification" editable="1"/>
    <field name="installation_type" editable="1"/>
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
    <field name="manometer" editable="1"/>
    <field name="manometric_height" editable="1"/>
    <field name="name" editable="1"/>
    <field name="networkseparation" editable="1"/>
    <field name="no_pumps" editable="1"/>
    <field name="no_valves" editable="1"/>
    <field name="open_water_surface" editable="1"/>
    <field name="orientation" editable="1"/>
    <field name="parcel" editable="1"/>
    <field name="rejected_flow" editable="1"/>
    <field name="remark" editable="1"/>
    <field name="sanitization_chlorine_gas" editable="1"/>
    <field name="sanitization_chlorine_liquid" editable="1"/>
    <field name="sanitization_ozone" editable="1"/>
    <field name="sanitization_uv" editable="1"/>
    <field name="settling" editable="1"/>
    <field name="status_active" editable="0"/>
    <field name="status_functional" editable="0"/>
    <field name="storage_fire" editable="1"/>
    <field name="storage_supply" editable="1"/>
    <field name="storage_total" editable="1"/>
    <field name="treatment_capacity" editable="1"/>
    <field name="update_geometry_alt1" editable="1"/>
    <field name="update_geometry_alt2" editable="1"/>
    <field name="water_meter" editable="1"/>
    <field name="year" editable="1"/>
    <field name="year_end" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="_cistern1_litrepercm" labelOnTop="0"/>
    <field name="_cistern2_litrepercm" labelOnTop="0"/>
    <field name="_geometry_alt1_used" labelOnTop="0"/>
    <field name="_geometry_alt2_used" labelOnTop="0"/>
    <field name="_installation_type_short" labelOnTop="0"/>
    <field name="_litrepercm" labelOnTop="0"/>
    <field name="_pipe_node_type" labelOnTop="0"/>
    <field name="_pipe_orientation" labelOnTop="0"/>
    <field name="_pipe_schema_visible" labelOnTop="0"/>
    <field name="_printmaps" labelOnTop="0"/>
    <field name="activatedcharcoal" labelOnTop="0"/>
    <field name="altitude" labelOnTop="0"/>
    <field name="altitude_apron" labelOnTop="0"/>
    <field name="altitude_overflow" labelOnTop="0"/>
    <field name="cistern1_dimension_1" labelOnTop="0"/>
    <field name="cistern1_dimension_2" labelOnTop="0"/>
    <field name="cistern1_fk_type" labelOnTop="0"/>
    <field name="cistern1_storage" labelOnTop="0"/>
    <field name="cistern2_dimension_1" labelOnTop="0"/>
    <field name="cistern2_dimension_2" labelOnTop="0"/>
    <field name="cistern2_fk_type" labelOnTop="0"/>
    <field name="cistern2_storage" labelOnTop="0"/>
    <field name="contract_end" labelOnTop="0"/>
    <field name="depth" labelOnTop="0"/>
    <field name="eca" labelOnTop="0"/>
    <field name="filtration_membrane" labelOnTop="0"/>
    <field name="filtration_sandorgravel" labelOnTop="0"/>
    <field name="fire_remote" labelOnTop="0"/>
    <field name="fire_valve" labelOnTop="0"/>
    <field name="fk_distributor" labelOnTop="0"/>
    <field name="fk_district" labelOnTop="0"/>
    <field name="fk_folder" labelOnTop="0"/>
    <field name="fk_locationtype" labelOnTop="0"/>
    <field name="fk_object_reference" labelOnTop="0"/>
    <field name="fk_overflow" labelOnTop="0"/>
    <field name="fk_parent" labelOnTop="0"/>
    <field name="fk_pipe_in" labelOnTop="0"/>
    <field name="fk_pipe_out" labelOnTop="0"/>
    <field name="fk_precision" labelOnTop="0"/>
    <field name="fk_precisionalti" labelOnTop="0"/>
    <field name="fk_pressurecontrol_type" labelOnTop="0"/>
    <field name="fk_pressurezone" labelOnTop="0"/>
    <field name="fk_printmap" labelOnTop="0"/>
    <field name="fk_pump_operating" labelOnTop="0"/>
    <field name="fk_pump_type" labelOnTop="0"/>
    <field name="fk_remote" labelOnTop="0"/>
    <field name="fk_source_quality" labelOnTop="0"/>
    <field name="fk_source_type" labelOnTop="0"/>
    <field name="fk_status" labelOnTop="0"/>
    <field name="fk_tank_firestorage" labelOnTop="0"/>
    <field name="fk_watertype" labelOnTop="0"/>
    <field name="flocculation" labelOnTop="0"/>
    <field name="flow_average" labelOnTop="0"/>
    <field name="flow_concession" labelOnTop="0"/>
    <field name="flow_lowest" labelOnTop="0"/>
    <field name="flow_meter" labelOnTop="0"/>
    <field name="gathering_chamber" labelOnTop="0"/>
    <field name="geometry_alt1" labelOnTop="0"/>
    <field name="geometry_alt2" labelOnTop="0"/>
    <field name="geometry_polygon" labelOnTop="0"/>
    <field name="height_max" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="identification" labelOnTop="0"/>
    <field name="installation_type" labelOnTop="0"/>
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
    <field name="manometer" labelOnTop="0"/>
    <field name="manometric_height" labelOnTop="0"/>
    <field name="name" labelOnTop="0"/>
    <field name="networkseparation" labelOnTop="0"/>
    <field name="no_pumps" labelOnTop="0"/>
    <field name="no_valves" labelOnTop="0"/>
    <field name="open_water_surface" labelOnTop="0"/>
    <field name="orientation" labelOnTop="0"/>
    <field name="parcel" labelOnTop="0"/>
    <field name="rejected_flow" labelOnTop="0"/>
    <field name="remark" labelOnTop="0"/>
    <field name="sanitization_chlorine_gas" labelOnTop="0"/>
    <field name="sanitization_chlorine_liquid" labelOnTop="0"/>
    <field name="sanitization_ozone" labelOnTop="0"/>
    <field name="sanitization_uv" labelOnTop="0"/>
    <field name="settling" labelOnTop="0"/>
    <field name="status_active" labelOnTop="0"/>
    <field name="status_functional" labelOnTop="0"/>
    <field name="storage_fire" labelOnTop="0"/>
    <field name="storage_supply" labelOnTop="0"/>
    <field name="storage_total" labelOnTop="0"/>
    <field name="treatment_capacity" labelOnTop="0"/>
    <field name="update_geometry_alt1" labelOnTop="0"/>
    <field name="update_geometry_alt2" labelOnTop="0"/>
    <field name="water_meter" labelOnTop="0"/>
    <field name="year" labelOnTop="0"/>
    <field name="year_end" labelOnTop="0"/>
  </labelOnTop>
  <widgets>
    <widget name="relation_cover_installation">
      <config type="Map">
        <Option value="" type="QString" name="nm-rel"/>
      </config>
    </widget>
    <widget name="relation_installation_parent">
      <config type="Map">
        <Option value="" type="QString" name="nm-rel"/>
      </config>
    </widget>
  </widgets>
  <previewExpression>coalesce(identification|| ' ','') || CASE
WHEN  "installation_type"  = 'chamber' THEN 'C. '
WHEN "installation_type"  = 'pressurecontrol' AND fk_pressurecontrol_type = 2801 THEN 'CR. '
WHEN  "installation_type"  = 'pressurecontrol' AND fk_pressurecontrol_type = 2802 THEN 'CCP. '
WHEN  "installation_type"  = 'pressurecontrol' AND fk_pressurecontrol_type = 2803 THEN 'CRA. '
WHEN  "installation_type"  = 'pump' THEN 'P. '
WHEN  "installation_type"  = 'source' THEN 'S. '
WHEN  "installation_type"  = 'tank' THEN 'R. '
WHEN  "installation_type"  = 'treatment' THEN 'T. '
ELSE ''
END
|| coalesce(name,'')</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
