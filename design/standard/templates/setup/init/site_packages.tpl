{* DO NOT EDIT THIS FILE! Use an override template instead. *}
{*?template charset=latin1?*}

<form method="post" action="{$script}">

  <div align="center">
    <h1>{"Site functionality"|i18n("design/standard/setup/init")}</h1>
  </div>

  <p>
    {"Please choose which extra functionality you want to include on your site."i18n("design/standard/setup/init")}
  </p>

{section show=$error}
<div class="error">
<p>
{$error|wash}
</p>
</div>
{/section}

{let site_type=$site_types[0]}

    <h2>{$site_types[0].name|wash}</h2>

    {section show=$site_type.thumbnail}
        <img class="site-type" src={concat( "design/standard/images/setup/", $site_type.thumbnail )|ezroot} alt="{$site_type.name|wash}" />
    {section-else}
        <img class="site-type" src={"design/standard/images/setup/eZ_setup_template_default.png"|ezroot} alt="{$site_type.name|wash}" />
    {/section}
    <input type="hidden" name="eZSetup_site_packages[]" value="" />

    <p>{$site_type.summary|wash}</p>

{/let}

<h2>{"Current site functionality"|i18n("design/standard/setup/init")}</h2>

<ul>
{section loop=$required_package_array}
    <li>{$:item.name|wash}</li>
{/section}
</ul>

<h2>{"Please select additional functionality"|i18n("design/standard/setup/init")}</h2>
{section loop=$package_array}
    <div class="block">
        <input type="checkbox" name="AdditionalPackages[]" value="{$:item.identifier|wash}" />&nbsp;{$:item.name|wash}<br/>
         <p>
         {$:item.description|wash}
         </p>
    </div>
{/section}

  {include uri="design:setup/persistence.tpl"}

  {include uri='design:setup/init/navigation.tpl'}

</form>
