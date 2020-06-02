package com.dxc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.Security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.dxc.chain.Block;
import com.dxc.chain.Candidate;
import com.dxc.chain.StringUtil;
import com.dxc.chain.Transaction;
import com.dxc.chain.TransactionConvert;
import com.dxc.chain.TransactionOutput;
import com.dxc.chain.Wallet;
import com.dxc.entity.User;
import com.dxc.service.UserService;

@Controller
public class HomeController {

	public static List<Block> blockchain = new ArrayList<Block>();
	public static HashMap<String, TransactionOutput> UTXOs = new HashMap<String, TransactionOutput>();
	public static List<Wallet> wallets = new ArrayList<Wallet>();
	public static List<Candidate> candidates = new ArrayList<Candidate>();

	List<TransactionConvert> result = new ArrayList<TransactionConvert>();
	int index = 0;

	public static int difficulty = 3;
	public static float minimumTransaction = 0.1f;
	public static Transaction genesisTransaction;
	public static Wallet newWallet;

	public static Wallet walletA;
	public static Wallet walletB;

	public static Wallet mainWallet;

	@Autowired
	UserService userService;

	public static boolean isNullOrEmpty(String str) {
		if (str != null && !str.isEmpty())
			return false;
		return true;
	}

	public static void addBlock(Block newBlock) {
		newBlock.mineBlock(difficulty);
		blockchain.add(newBlock);
	}

	@GetMapping("/")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView("home");
		return mv;
	}

	@PostMapping("/getData")
	@ResponseBody
	public List<TransactionConvert> getData() {
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
		if (blockchain.size() > 0) {
			for (int i = index; i < blockchain.size(); i++) {
				System.out.println("block " + i + ":");
				List<Transaction> transBlock = blockchain.get(i).transactions;
				if (transBlock.size() > 0) {
					TransactionConvert e = new TransactionConvert(transBlock.get(0).transactionId,
							transBlock.get(0).sender.toString(), transBlock.get(0).reciepient.toString(),
							transBlock.get(0).value);
					result.add(e);
				}
			}
			index = blockchain.size();
		}
		return result;
	}

	@GetMapping("/admin")
	public String admin() {
		List<User> users = userService.findAll();
		return "admin";
	}

	@SuppressWarnings("serial")
	@PostMapping("/setting")
	@ResponseBody
	public byte[] settingWallet() {
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
		try {
			if (blockchain.size() == 0) {
				mainWallet = new Wallet();
				Wallet coinbase = new Wallet();
				genesisTransaction = new Transaction(coinbase.publicKey, mainWallet.publicKey, 1000000, null);
				genesisTransaction.generateSignature(coinbase.privateKey);
				genesisTransaction.transactionId = "0";
				genesisTransaction.outputs.add(new TransactionOutput(genesisTransaction.reciepient,
						genesisTransaction.value, genesisTransaction.transactionId));
				UTXOs.put(genesisTransaction.outputs.get(0).id, genesisTransaction.outputs.get(0));
				Block genesis = new Block("0");
				genesis.addTransaction(genesisTransaction);
				addBlock(genesis);
				wallets.add(mainWallet);
				List<String> names = new ArrayList<String>() {
					{
						add("Nguyen Van Mot");
						add("Nguyen Van Hai");
						add("Nguyen Van Ba");
						add("Nguyen Van Bon");
						add("Nguyen Van Nam");
					}
				};
				for (int i = 0; i < 5; i++) {
					newWallet = new Wallet();
					Block block = new Block(blockchain.get(blockchain.size() - 1).hash);
					block.addTransaction(wallets.get(0).sendFunds(newWallet.publicKey, 0));
					addBlock(block);
					wallets.add(newWallet);
					candidates.add(new Candidate(names.get(i), 30, newWallet.publicKey.toString().trim()));
				}
				return "Thiết lập thành công".getBytes(StandardCharsets.UTF_8);
			} else {
				return "Thiết lập thất bại".getBytes(StandardCharsets.UTF_8);
			}

		} catch (Exception e) {
			// TODO: handle exception
			return "Thiết lập thất bại".getBytes(StandardCharsets.UTF_8);
		}
	}

	@PostMapping("/create-user")
	@ResponseBody
	public byte[] saveWallet() {
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
		try {
			newWallet = new Wallet();
			Block block = new Block(blockchain.get(blockchain.size() - 1).hash);
			block.addTransaction(wallets.get(0).sendFunds(newWallet.publicKey, 1));
			addBlock(block);
			wallets.add(newWallet);
			// save user(username, password, privatekey, publickey)
			return "Tạo ví thành công".getBytes(StandardCharsets.UTF_8);
		} catch (Exception e) {
			// TODO: handle exception
			return "Tạo ví thất bại".getBytes(StandardCharsets.UTF_8);
		}
	}

	@PostMapping("/get-count-vote")
	@ResponseBody
	public int countVote(@RequestBody String privateKey) {
		if (wallets.size() > 0) {
			for (int i = 0; i < wallets.size(); i++) {
				if (StringUtil.comparrKey(wallets.get(i).privateKey.toString().trim(), privateKey.trim()))
					return wallets.get(i).getBalance();
			}
		}
		return 0;
	}

	@PostMapping("/vote")
	@ResponseBody
	public TransactionConvert vote(@RequestBody String to) {
		// get privatekey from user login
		String from = "";
		// data is public's candicate
		Wallet fromWallet = new Wallet();
		Wallet toWallet = new Wallet();
		int flag = 0;
		if (wallets.size() > 0) {
			for (int i = 0; i < wallets.size(); i++) {
				if (StringUtil.comparrKey(wallets.get(i).privateKey.toString(), from)) {
					fromWallet = wallets.get(i);
					flag++;
					if (flag == 2)
						break;
				} else if (StringUtil.comparrKey(wallets.get(i).publicKey.toString(), to)) {
					toWallet = wallets.get(i);
					flag++;
					if (flag == 2)
						break;
				}
			}
		}
		Block block1 = new Block(blockchain.get(blockchain.size() - 1).hash);
		block1.addTransaction(fromWallet.sendFunds(toWallet.publicKey, 1));
		addBlock(block1);
		List<Transaction> transBlock = blockchain.get(blockchain.size() - 1).transactions;
		TransactionConvert e = new TransactionConvert(transBlock.get(0).transactionId,
				transBlock.get(0).sender.toString(), transBlock.get(0).reciepient.toString(), transBlock.get(0).value);
		return e;
	}

	//// test console
	public static void main(String[] args) {
		// add our blocks to the blockchain ArrayList:
		Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider()); // Setup Bouncey castle as a
		// Create wallets:
		walletA = new Wallet();
		walletB = new Wallet();
		Wallet coinbase = new Wallet();

		genesisTransaction = new Transaction(coinbase.publicKey, walletA.publicKey, 1, null);
		genesisTransaction.generateSignature(coinbase.privateKey); 
		genesisTransaction.transactionId = "0";
		genesisTransaction.outputs.add(new TransactionOutput(genesisTransaction.reciepient, genesisTransaction.value,
				genesisTransaction.transactionId)); 
		UTXOs.put(genesisTransaction.outputs.get(0).id, genesisTransaction.outputs.get(0));
		System.out.println("Creating and Mining Genesis block... ");
		Block genesis = new Block("0");
		genesis.addTransaction(genesisTransaction);
		addBlock(genesis);

		// testing
		Block block1 = new Block(genesis.hash);
		block1.addTransaction(walletA.sendFunds(walletB.publicKey, 1));
		addBlock(block1);
		System.out.println("\nWalletA\'s balance is: " + walletA.getBalance());
		System.out.println("WalletB\'s balance is: " + walletB.getBalance());

		System.out.println("Histories block");

		if (blockchain.size() > 0) {
			for (int i = 0; i < blockchain.size(); i++) {
				System.out.println("block " + i + ":");
				List<Transaction> transBlock = blockchain.get(i).transactions;
				if (transBlock.size() > 0) {
					System.out.println(transBlock.get(0).toString());
				} else {
					System.out.println("Block " + i + " have no transaction");
				}

			}
		}
	}

}
