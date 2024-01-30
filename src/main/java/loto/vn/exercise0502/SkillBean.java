package loto.vn.exercise0502;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;

public class SkillBean implements Serializable {
    public ArrayList<String> SKILL_LIST = new ArrayList<>(Arrays.asList("Leadership","Teamwork","Integrity","Confidence","Optimism", "Communication", "Adaptability", "Creativity","Honestly","Flexibility"));

    public String name = "";

    public ArrayList<String> obtaining_List = new ArrayList<>();
    public ArrayList<String> missing_List = new ArrayList<>();

    public ArrayList<String> getList() {
        return SKILL_LIST;
    }

    public void setList(ArrayList<String> skillList) {
        this.SKILL_LIST = skillList;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<String> getObtainingList() {
        return obtaining_List;
    }

    public void setObtainingList(ArrayList<String> obtaining_List) {
        this.obtaining_List = obtaining_List;
        setMissingList();
    }

    public ArrayList<String> getMissingList() {
        return missing_List;
    }

    public void setMissingList() {
        for (String missingSkill : SKILL_LIST) {
            if (!obtaining_List.contains(missingSkill)) {
                missing_List.add(missingSkill);
            }
        }
    }

}
