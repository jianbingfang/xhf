package com.xthena.bpm.support;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.activiti.engine.delegate.VariableScope;

public class MapVariableScope implements VariableScope {
    private Map<String, Object> map = new HashMap<String, Object>();

    @Override
	public Map<String, Object> getVariables() {
        return map;
    }

    @Override
	public Map<String, Object> getVariablesLocal() {
        return map;
    }

    @Override
	public Object getVariable(String variableName) {
        return map.get(variableName);
    }

    @Override
	public Object getVariableLocal(String variableName) {
        return map.get(variableName);
    }

    @Override
	public Set<String> getVariableNames() {
        return map.keySet();
    }

    @Override
	public Set<String> getVariableNamesLocal() {
        return map.keySet();
    }

    @Override
	public void setVariable(String variableName, Object value) {
        map.put(variableName, value);
    }

    @Override
	public Object setVariableLocal(String variableName, Object value) {
        map.put(variableName, value);

        return value;
    }

    @Override
	public void setVariables(Map<String, ? extends Object> variables) {
        map.putAll(variables);
    }

    @Override
	public void setVariablesLocal(Map<String, ? extends Object> variables) {
        map.putAll(variables);
    }

    @Override
	public boolean hasVariables() {
        return !map.isEmpty();
    }

    @Override
	public boolean hasVariablesLocal() {
        return !map.isEmpty();
    }

    @Override
	public boolean hasVariable(String variableName) {
        return map.containsKey(variableName);
    }

    @Override
	public boolean hasVariableLocal(String variableName) {
        return map.containsKey(variableName);
    }

    @Override
	public void createVariableLocal(String variableName, Object value) {
        map.put(variableName, value);
    }

    @Override
	public void removeVariable(String variableName) {
        map.remove(variableName);
    }

    @Override
	public void removeVariableLocal(String variableName) {
        map.remove(variableName);
    }

    @Override
	public void removeVariables(Collection<String> variableNames) {
        for (String variableName : variableNames) {
            map.remove(variableName);
        }
    }

    @Override
	public void removeVariablesLocal(Collection<String> variableNames) {
        for (String variableName : variableNames) {
            map.remove(variableName);
        }
    }

    @Override
	public void removeVariables() {
        map.clear();
    }

    @Override
	public void removeVariablesLocal() {
        map.clear();
    }
}
