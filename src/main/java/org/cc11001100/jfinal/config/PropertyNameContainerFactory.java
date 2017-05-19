package org.cc11001100.jfinal.config;

import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import com.jfinal.plugin.activerecord.IContainerFactory;
 
/**
 * 
 * 用来在驼峰下划线之间进行转换
 *  
 * @author CC11001100
 *
 */
@SuppressWarnings({ "rawtypes", "unchecked" })
public class PropertyNameContainerFactory implements IContainerFactory {
 
    public Object convert(Object key) {
        if (key instanceof String) {
            String property = null;
            String alias = null;
            if (((String) key).indexOf(".") > -1) {
                String[] properties = ((String) key).split("\\.");
                alias = properties[0];
                property = properties[1];
            } else {
                property = ((String) key);
            }
            StringBuilder buf = new StringBuilder(property);
            for (int i = 1; i < buf.length() - 1; i++) {
                if (Character.isLowerCase(buf.charAt(i - 1)) && Character.isUpperCase(buf.charAt(i))
                        && Character.isLowerCase(buf.charAt(i + 1))) {
                    buf.insert(i++, '_');
                }
            }
            return (alias != null ? alias + "." : "")
                    + (toUpperCase ? buf.toString().toUpperCase() : buf.toString().toLowerCase());
        }
        return key;
    }
 
    private static boolean toUpperCase = true;
 
    public PropertyNameContainerFactory() {
    }
 
    public PropertyNameContainerFactory(boolean toUpperCase) {
        PropertyNameContainerFactory.toUpperCase = toUpperCase;
    }
 
    public Map<String, Object> getAttrsMap() {
        return new PropertyNameMap();
    }
 
    public Map<String, Object> getColumnsMap() {
        return new PropertyNameMap();
    }
 
    public Set<String> getModifyFlagSet() {
        return new PropertyNameSet();
    }
 
    public class PropertyNameSet extends HashSet {
        private static final long serialVersionUID = 2337255096474815584L;
 
        public boolean add(Object e) {
            return super.add(convert(e));
        }
 
        public boolean remove(Object e) {
            return super.remove(convert(e));
        }
 
        public boolean contains(Object e) {
            return super.contains(convert(e));
        }
 
        public boolean addAll(Collection c) {
            boolean modified = false;
            for (Object o : c)
                if (super.add(convert(o)))
                    modified = true;
            return modified;
        }
    }
 
    public class PropertyNameMap extends HashMap {
        private static final long serialVersionUID = -4107018318847768335L;
 
        public Object get(Object key) {
            return super.get(convert(key));
        }
 
        public boolean containsKey(Object key) {
            return super.containsKey(convert(key));
        }
 
        public Object put(Object key, Object value) {
            return super.put(convert(key), value);
        }
 
        public void putAll(Map m) {
            for (Map.Entry e : (Set<Map.Entry>) (m.entrySet()))
                super.put(convert(e.getKey()), e.getValue());
        }
 
        public Object remove(Object key) {
            return super.remove(convert(key));
        }
    }
}