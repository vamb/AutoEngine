<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<!-- Auto generated at ${generationTime} -->
<mapper namespace="com.mh.proj.persist.domain.myBatis${className}Mapper">
	<select id="get${className}ById" parameterType="${parameterType}" 
			resultType="_${className}">
		select * from `${className}` where id=${primaryKeyName}
	</select>
	<select id="get${className}ByCondition" parameterType="_${className}" 
			resultType="_${className}">
		select * from `${className}` 
		<trim prefix="where" prefixOverrides="and|or"> 
			1 = 1
		<#list fieldList>
		<#items as field>
		<#if field.name != "creationDate" && field.name != "lastUpdatedDate" && field.name != "creationBy" && field.name != "lastUpdatedBy">
			<if test="${field.name} != null and ${field.name} != ''">
				and ${field.name} = ${"#{"}${field.name}${"}"}
			</if>
		</#if> 
		</#items>
		</#list>
		</trim>
	</select>
	<select id="get${className}ByPager" parameterType="_${className}" 
			resultType="_${className}">
		select * from `${className}` 
		<trim prefix="where" prefixOverrides="and|or"> 
			1 = 1
		<#list fieldList>
		<#items as field>
		<#if field.name != "creationDate" && field.name != "lastUpdatedDate" && field.name != "creationBy" && field.name != "lastUpdatedBy">
			<if test="${field.name} != null and ${field.name} != ''">
				and ${field.name} like concat('%',${"#{"}${field.name}${"}"},'%')
			</if>
		</#if> 
		</#items>
		</#list>
		</trim>
	</select>
	<insert id="add${className}" parameterType="_${className}">
		insert into `${className}`(${propertyList}) values (${propertyValueList})
	</insert>
	<insert id="add${className}Selective" parameterType="_${className}">
		insert into `${className}`
		<trim prefix="(" suffix=")" suffixOverrides=",">
		<#list fieldList>
		<#items as field>
		<#if field.name == "id">
		<#else>
			<if test="${field.name} != null">
				${field.name},
			</if>
		</#if>
		</#items>
		</#list>
		</trim>
		<trim prefix="values (" suffix=")" suffixOverrides=",">
		<#list fieldList>
		<#items as field>
		<#if field.name == "id">
		<#else>
			<if test="${field.name} != null">
				${"#{"}${field.name}${"}"},
			</if>
		</#if>
		</#items>
		</#list>
		</trim>
	</insert>
	<delete id="delete${className}ById" parameterType="${parameterType}">
		delete from `${className}` where id=${primaryKeyName}
	</delete>
	<delete id="delete${className}List">
		delete from `${className}` where id in
		<foreach collection="list" index="index" item="item" open="(" separator="," close=")">
		${"#{"}item${"}"}
		</foreach>
	</delete>
	<delete id="delete${className}Array">
		delete from `${className}` where id in
		<foreach collection="array" index="index" item="item" open="(" separator="," close=")">
		${"#{"}item${"}"}
		</foreach>
	</delete>
	<update id="update${className}ById" parameterType="_${className}">
		update `${className}` set ${updatePropertyList} where id=${primaryKeyName}
	</update>
	<update id="update${className}ByIdSelective" parameterType="_${className}">
		update `${className}`
		<set>
		<#list fieldList>
		<#items as field>
		<#if field.name == "id">
		<#else>
			<if test="${field.name} != null">
				${field.name}=${"#{"}${field.name}${"}"},
			</if>
		</#if>
		</#items>
		</#list>
		</set>
		where id=${primaryKeyName}
	</update>
	<select id="getAll${className}List" resultType="_${className}">
		select * from `${className}`
	</select>
</mapper>