// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract Structs {
     // struct 讓資料被分組在一起

     // 自定義型別 Car
     struct Car {
         string model;
         uint year;
         address owner;
     }

     // 與其他型別合併聲明為狀態變量
     
     // 用 Car 型別，聲明狀態變量 car
     Car public car;
     // 用 Car 型別，聲明 Car 陣列
     Car[] public cars;
     // 聲明一組 mapping，定義從 owner 到汽車的映射 (可以 own 多台車)
     mapping(address => Car[]) public carsByOwner;

    // 初始化 struct 的三種方法
     function examples() external {
        // 方法一：按照 struct 聲明順序，傳入參數
        Car memory toyota = Car("Toyota", 1990, msg.sender);
        // 方法二：透過「鍵值對」賦值，順序不重要
        Car memory lambo = Car({ year: 1980, model: "Lamborghini", owner: msg.sender });
        // 方法三：先聲明，再賦值
        // 僅聲明未賦值時，其值為對應資料型別的預設值
        Car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 2010;
        tesla.owner =  msg.sender;

        // 執行 examples，上面聲明的變量，將在函式執行結束後消失，故需要存入外部狀態變量中
        cars.push(toyota);
        cars.push(lambo);
        cars.push(tesla);

        // 不必非得初始化為 memory，也可以 inline 完成
        // 下列行為，等同於在 memory 中初始化 Car，建立 struct 後，將其存入陣列 cars
        cars.push(Car("Ferrari", 2020, msg.sender));

        // cars 結果為 [toyota, lambo, tesla, ferrari]

        // 若用 memory 聲明，不會保存後續 update 的結果
        Car storage _car = cars[0];
        /* 
        0: string: model Toyota
        1: uint256: year 1990
        2: address: owner 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
        */
        
        // update struct Car 
        _car.year = 1999; // Car("Toyota", 1999, msg.sender);
        /* 
        0: string: model Toyota
        1: uint256: year 1999
        2: address: owner 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
        */
        
        // delete struct Car
        delete _car.owner; // _car ("Toyota", 1990, address(0));
        /* 
        0: string: model Toyota
        1: uint256: year 1999
        2: address: owner 0x0000000000000000000000000000000000000000
        */

        // delete item in struct array Car[]
        delete cars[1]; 
        /* 
        0: string: model
        1: uint256: year 0
        2: address: owner 0x0000000000000000000000000000000000000000
        */
     }
}

// 用 memory 作為儲存方式，變量僅在調用該函式時存在
// 聲明(declare)為 memory，代表將資料存入 memory
// 聲明(declare)為 storage，代表將資料存入 storage