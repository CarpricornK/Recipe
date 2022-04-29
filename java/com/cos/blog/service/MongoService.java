package com.cos.blog.service;

import com.cos.blog.Mapper.IMongoMapper;
import com.cos.blog.model.MongoDTO;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.Resource;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

@Slf4j
@Service("MongoService")
public class MongoService implements IMongoService {

    @Resource(name = "MongoMapper")
    private IMongoMapper mongoMapper; // MongoDB에 저장할 Mapper

    @Override
    public void mongoTest() throws Exception {

        // 로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
        log.info(this.getClass().getName() + ".mongoTest Start!");

        String result = "";

        ArrayList<Object> arrayOfDifferentObject = null;
        try {
            URL url = new URL("http://openapi.foodsafetykorea.go.kr/api/43838cb27b9b42369020/COOKRCP01/json/0/1000");

            BufferedReader bf;

            bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

            result = bf.readLine();

            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject) jsonParser.parse(result);
            JSONObject COOKRCP01Result = (JSONObject) jsonObject.get("COOKRCP01");
            JSONArray rowInfo = (JSONArray) COOKRCP01Result.get("row");

            arrayOfDifferentObject = new ArrayList<Object>();

            for (int i = 0; i <= 5; i++) {

                JSONObject astro1 = (JSONObject) rowInfo.get(i);

                String RCP_PARTS_DTLS = (String) ((JSONObject) rowInfo.get(i)).get("RCP_PARTS_DTLS");
                String RCP_WAY2 = String.valueOf(((JSONObject) rowInfo.get(i)).get("RCP_WAY2"));
                String RCP_SEQ = (String) ((JSONObject) rowInfo.get(i)).get("RCP_SEQ");
                String INFO_NA = (String) ((JSONObject) rowInfo.get(i)).get("INFO_NA");
                String INFO_WGT = (String) ((JSONObject) rowInfo.get(i)).get("INFO_WGT");
                String INFO_PRO = (String) ((JSONObject) rowInfo.get(i)).get("INFO_PRO");
                String INFO_FAT = (String) ((JSONObject) rowInfo.get(i)).get("INFO_FAT");
                String RCP_PAT2 = (String) ((JSONObject) rowInfo.get(i)).get("RCP_PAT2");
                String INFO_CAR = (String) ((JSONObject) rowInfo.get(i)).get("INFO_CAR");
                String INFO_ENG = (String) ((JSONObject) rowInfo.get(i)).get("INFO_ENG");
                String RCP_NM = (String) ((JSONObject) rowInfo.get(i)).get("RCP_NM");
                String ATT_FILE_NO_MK = (String) ((JSONObject) rowInfo.get(i)).get("ATT_FILE_NO_MK");
                String ATT_FILE_NO_MAIN = (String) ((JSONObject) rowInfo.get(i)).get("ATT_FILE_NO_MAIN");
                String MANUAL_IMG01 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL_IMG01");
                String MANUAL_IMG02 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL_IMG02");
                String MANUAL_IMG03 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL_IMG03");
                String MANUAL_IMG04 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL_IMG04");
                String MANUAL_IMG05 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL_IMG05");
                String MANUAL_IMG06 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL_IMG06");
                String MANUAL_IMG07 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL_IMG07");
                String MANUAL_IMG08 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL_IMG08");
                String MANUAL_IMG09 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL_IMG09");
                String MANUAL_IMG10 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL_IMG10");
                String MANUAL_IMG11 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL_IMG11");
                String MANUAL_IMG12 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL_IMG12");
                String MANUAL_IMG13 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL_IMG13");
                String MANUAL_IMG14 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL_IMG14");
                String MANUAL_IMG15 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL_IMG15");
                String MANUAL_IMG16 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL_IMG16");
                String MANUAL_IMG17 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL_IMG17");
                String MANUAL_IMG18 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL_IMG18");
                String MANUAL_IMG19 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL_IMG19");
                String MANUAL_IMG20 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL_IMG20");
                String MANUAL01 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL01");
                String MANUAL02 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL02");
                String MANUAL03 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL03");
                String MANUAL04 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL04");
                String MANUAL05 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL05");
                String MANUAL06 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL06");
                String MANUAL07 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL07");
                String MANUAL08 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL08");
                String MANUAL09 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL09");
                String MANUAL10 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL10");
                String MANUAL11 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL11");
                String MANUAL12 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL12");
                String MANUAL13 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL13");
                String MANUAL14 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL14");
                String MANUAL15 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL15");
                String MANUAL16 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL16");
                String MANUAL17 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL17");
                String MANUAL18 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL18");
                String MANUAL19 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL19");
                String MANUAL20 = (String) ((JSONObject) rowInfo.get(i)).get("MANUAL20");

                arrayOfDifferentObject.add(RCP_PARTS_DTLS);
                arrayOfDifferentObject.add(INFO_WGT);
                arrayOfDifferentObject.add(MANUAL01);
                arrayOfDifferentObject.add(MANUAL_IMG01);

//                System.out.println("1 : " + rowInfo);
//                System.out.println("2 : " + RCP_PARTS_DTLS);
//                System.out.println("3 : " + INFO_WGT);
//                System.out.println("4 : " + MANUAL01);
//                System.out.println("5 : " + MANUAL_IMG01);

//                // 생성할 컬렉션명
//                String colNm = "MONGODB_123456";
//
//                MongoDTO pDTO = new MongoDTO();
//
//                pDTO.setATT_FILE_NO_MAIN(ATT_FILE_NO_MAIN);
//                pDTO.setATT_FILE_NO_MK(ATT_FILE_NO_MK);
//                pDTO.setINFO_ENG(INFO_ENG);
//                pDTO.setINFO_CAR(INFO_CAR);
//                pDTO.setINFO_FAT(INFO_FAT);
//                pDTO.setINFO_CAR(INFO_CAR);
//                pDTO.setINFO_NA(INFO_NA);
//                pDTO.setINFO_PRO(INFO_PRO);
//                pDTO.setINFO_WGT(INFO_WGT);
//                pDTO.setRCP_NM(RCP_NM);
//                pDTO.setRCP_PARTS_DTLS(RCP_PARTS_DTLS);
//                pDTO.setRCP_PAT2(RCP_PAT2);
//                pDTO.setRCP_SEQ(RCP_SEQ);
//                pDTO.setRCP_WAY2(RCP_WAY2);
//                pDTO.setMANUAL01(MANUAL01);
//                pDTO.setMANUAL02(MANUAL02);
//                pDTO.setMANUAL03(MANUAL03);
//                pDTO.setMANUAL04(MANUAL04);
//                pDTO.setMANUAL05(MANUAL05);
//                pDTO.setMANUAL06(MANUAL06);
//                pDTO.setMANUAL07(MANUAL07);
//                pDTO.setMANUAL08(MANUAL08);
//                pDTO.setMANUAL09(MANUAL09);
//                pDTO.setMANUAL10(MANUAL10);
//                pDTO.setMANUAL11(MANUAL11);
//                pDTO.setMANUAL12(MANUAL12);
//                pDTO.setMANUAL13(MANUAL13);
//                pDTO.setMANUAL14(MANUAL14);
//                pDTO.setMANUAL15(MANUAL15);
//                pDTO.setMANUAL16(MANUAL16);
//                pDTO.setMANUAL17(MANUAL17);
//                pDTO.setMANUAL18(MANUAL18);
//                pDTO.setMANUAL19(MANUAL19);
//                pDTO.setMANUAL20(MANUAL20);
//                pDTO.setMANUAL_IMG01(MANUAL_IMG01);
//                pDTO.setMANUAL_IMG02(MANUAL_IMG02);
//                pDTO.setMANUAL_IMG03(MANUAL_IMG03);
//                pDTO.setMANUAL_IMG04(MANUAL_IMG04);
//                pDTO.setMANUAL_IMG05(MANUAL_IMG05);
//                pDTO.setMANUAL_IMG06(MANUAL_IMG06);
//                pDTO.setMANUAL_IMG07(MANUAL_IMG07);
//                pDTO.setMANUAL_IMG08(MANUAL_IMG08);
//                pDTO.setMANUAL_IMG09(MANUAL_IMG09);
//                pDTO.setMANUAL_IMG10(MANUAL_IMG10);
//                pDTO.setMANUAL_IMG11(MANUAL_IMG11);
//                pDTO.setMANUAL_IMG12(MANUAL_IMG12);
//                pDTO.setMANUAL_IMG13(MANUAL_IMG13);
//                pDTO.setMANUAL_IMG14(MANUAL_IMG14);
//                pDTO.setMANUAL_IMG15(MANUAL_IMG15);
//                pDTO.setMANUAL_IMG16(MANUAL_IMG16);
//                pDTO.setMANUAL_IMG17(MANUAL_IMG17);
//                pDTO.setMANUAL_IMG18(MANUAL_IMG18);
//                pDTO.setMANUAL_IMG19(MANUAL_IMG19);
//                pDTO.setMANUAL_IMG20(MANUAL_IMG20);
//
////                pDTO.setUser_nm("34325643");
////                pDTO.setAddr("8djmd65");
////                pDTO.setEmail("asdwe346@kopo.ac.kr");
//
//                // MongoDB에 데이터저장하기
//                mongoMapper.insertData(pDTO, colNm);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        for (int i = 0; i < arrayOfDifferentObject.size(); i++) {
            System.out.println(arrayOfDifferentObject.get(i));
        }


        // 로그 찍기(추후 찍은 로그를 통해 이 함수에 접근했는지 파악하기 용이하다.)
        log.info(this.getClass().getName() + ".mongoTest End!");

    }


}

