<style>
.navbar-expand-lg .navbar-nav .nav-link.active:before {
    top: auto;
    bottom: calc(-.75rem - 1px);
    right: .5rem;
    left: .5rem;
    border-left: 0;
    border-bottom: 1px solid #2c7be5;
}
.navbar-nav .nav-link.active:before {
    content: '';
    position: absolute;
    left: 0;
    top: .5rem;
    bottom: .5rem;
    border-left: 2px solid #2c7be5;
}
.navbar-expand-lg .navbar-nav .nav-link {
    padding: .625rem .5rem;
}
.navbar-light .navbar-nav .nav-link {
    color: #6e84a3;
}
.navbar-expand-lg .navbar-nav .nav-link.active:before {
    top: auto;
    bottom: calc(-.75rem - 1px);
    right: .5rem;
    left: .5rem;
    border-left: 0;
    border-bottom: 1px solid #2c7be5;
}
</style>
<div aria-expanded="true" class="navbar navbar-expand-lg navbar-light" id="navigationCollapse">
 <div class="container" style="align-items: center;">
	 <div id="heading">
			<div aria-level="1" class="site-title" role="heading">
				<a class="navbar-brand mr-auto" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
					<img alt="${logo_description}"  src="${site_logo}" style="max-width: 100%;max-height: 8.5rem;" />
				</a>

				<#if show_site_name>
					<span class="site-name" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
						${site_name}
					</span>
				</#if>
			</div>
	  </div>
	
  	 <ul class="navbar-nav mr-lg-auto" aria-label="<@liferay.language key="site-pages" />" role="menubar">
		<#list nav_items as nav_item>
			<#assign
				nav_item_attr_has_popup = ""
				nav_item_css_class = ""
				nav_item_layout = nav_item.getLayout()
			/>

			<#if nav_item.isSelected()>
				<#assign
					nav_item_attr_has_popup = "aria-haspopup='true'"
					nav_item_css_class = "selected"
				/>
			</#if>

			<li class="nav-item dropdown" id="layout_${nav_item.getLayoutId()}" role="presentation">
				<a class="dropdown-item active" aria-labelledby="layout_${nav_item.getLayoutId()}" ${nav_item_attr_has_popup} href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem"><span><@liferay_theme["layout-icon"] layout=nav_item_layout /> ${nav_item.getName()}</span></a>

				<#if nav_item.hasChildren()>
					<ul class="dropdown-menu" role="menu">
						<#list nav_item.getChildren() as nav_child>
							<#assign
								nav_child_css_class = ""
							/>

							<#if nav_item.isSelected()>
								<#assign
									nav_child_css_class = "selected"
								/>
							</#if>

							<li id="layout_${nav_child.getLayoutId()}" role="presentation">
								<a class="dropdown-item active" aria-labelledby="layout_${nav_child.getLayoutId()}" href="${nav_child.getURL()}" ${nav_child.getTarget()} role="menuitem">${nav_child.getName()}</a>
							</li>
						</#list>
					</ul>
				</#if>
			</li>
		</#list>
	 </ul>
	 <div class="align-items-md-end align-items-start d-flex porygon-search" role="search">
		<div class="porygon-search-form w-100">
			<@liferay.search default_preferences=freeMarkerPortletPreferences.getPreferences("portletSetupPortletDecoratorId", "barebone") />
		</div>
		
	  </div>
	   <#if !is_signed_in>
			<a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
	  </#if>
   
	 <#if is_signed_in>
      
	     <@liferay.user_personal_bar />
       
      </#if>

 </div>
  
</div>

<style>
	.user-avatar-link {
	  display: flex;
	}
	.portlet-title-text { 
	  display:none;
	}
</style>