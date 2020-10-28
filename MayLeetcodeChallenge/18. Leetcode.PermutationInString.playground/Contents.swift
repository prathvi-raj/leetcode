import Foundation

/*
 Given two strings s1 and s2, write a function to return true if s2 contains the permutation of s1. In other words, one of the first string's permutations is the substring of the second string.

  

 Example 1:

 Input: s1 = "ab" s2 = "eidbaooo"
 Output: True
 Explanation: s2 contains one permutation of s1 ("ba").
 Example 2:

 Input:s1= "ab" s2 = "eidboaoo"
 Output: False
  

 Note:

 The input strings only contain lower case letters.
 The length of both given strings is in range [1, 10,000].
 */


class Solution {
    
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        guard s2.count >= s1.count else {
            return false
        }
        
        let c1 = s1.count, c2 = s2.count, s = Array(s2)
        
        var store = s1.reduce(into: [Character: Int](), { $0[$1] = $0[$1, default: 0] - 1 })
        
        func updateDict(_ char: Character, _ inc: Int) {
            let v = store[char, default: 0] + inc
            store[char] = v == 0 ? nil : v
        }
        
        for i in 0..<c1 {
            updateDict(s[i], 1)
        }
         
        if store.isEmpty {
            return true
        }
        
        var i = c1
        while i < c2 {
            updateDict(s[i - c1], -1)
            updateDict(s[i], 1)
            i += 1
            if store.isEmpty { return true }
        }
        return false
    }
}

/*
class Solution {
    
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        
        guard s2.count >= s1.count else {
            return false
        }
        
        var store: [Character: Int] = [:]
        
        for a in s1 {
            store[a] = (store[a] ?? 0) + 1
        }
        
        let s2 = Array(s2)
        for p in 0..<(s2.count - s1.count + 1) {
            if isValidPermutation2(String(s2[p...(p + s1.count - 1)]), store) {
                return true
            }
        }
        return false
    }
    
    private func isValidPermutation2(_ s: String, _ store: [Character: Int]) -> Bool {
        
        var anotherStore: [Character: Int] = [:]
        
        for a in s {
            anotherStore[a] = (anotherStore[a] ?? 0) + 1
        }
        
        if store.keys.count != anotherStore.keys.count {
            return false
        }
        
        for (k,v) in store {
            
            if anotherStore[k] == nil {
                return false
            }
            
            if anotherStore[k]! != v {
                return false
            }
        }
        
        return true
    }

    
    private func isValidPermutation(_ s: String, _ store: [Character: Int]) -> Bool {
        var store = store
        for a in s {
            if store[a] == nil {
                return false
            }
            store[a] = (store[a] ?? 0) - 1
            if store[a] == 0 {
                store.removeValue(forKey: a)
            }
        }
        if store.isEmpty {
            return true
        }
        return false
    }
}
*/

/*
class Solution {
    
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        
        guard s2.count >= s1.count else {
            return false
        }
        
        var permutations: [String: Int] = [:]
        self.permutations(s: s1, 0, s1.count - 1, result: &permutations)
        if permutations.isEmpty {
            return false
        }
        
        print(permutations)
        let s2 = Array(s2)
        for p in 0..<(s2.count - s1.count + 1) {
            if permutations[String(s2[p...(p + s1.count - 1)])] != nil {
                return true
            }
        }
        return false
    }
    
    func permutations(s: String, _ l: Int, _ r: Int, result: inout [String: Int]) -> Void {
        var s = Array(s)
        
        if s.isEmpty {
            return
        }
        
        if s.count == 1 {
            result[String(s[0])] = 1
            return
        }
        
        if l == r {
            result[String(s)] = (result[String(s)] ?? 0) + 1
        }else {
            for i in l...r {
                var temp = s[l]
                s[l] = s[i]
                s[i] = temp
                permutations(s: String(s), l+1, r, result: &result)
                temp = s[l]
                s[l] = s[i]
                s[i] = temp
            }
        }
    }
}
*/
let s1 = "nlrsecrfraocbgnsazsngoqjljquksbcspyuqobkpuagfbndhpstpfzatxcwscjwqnjjtlogljhyhtgrpauxnuzlrhljgdlgdpxyahgmdwytivtqccpdukhseoajdmsaozhtnrsjvyzpigvbrxdxqresnuhyzgupaijresrlhtnjkyfwpxairirkzuajnpayhbhyerfqnmwdgqmjzvrdvlsnmxitnumipyfixlzchjwgvfzpsryxxotnuoftqffmiozywskuvnjkuehevohverpbisoblzurysiaqrsqwqfncuqkqbecvrxbkrjiddmfauvetruxwqnelbufekkkwofupyssmkkobatpjthrxgwlpttfupiormualobswtzwwcnrqyxlqfrnvgeeezsacljnewfvvbtzfrvdllqrlvguiinpdxkbhqzgqafzsvvhpijjsqgnyxeoqldfrbbuadzpskrhpziuaoqrvwpionmiojuhxgkufkgaavdeujuxpmggngquxnyqhrdvpxnjwqtlnwnroswrzxxdksfvrnclwonklpomzhwldjjtyylkhgayuuzlbdgacoyhlajtpvgubvwvzmvnuibfcpncqiopzodxbbjohfswkbzgbgtubxqzjnhupkjgyduvfejonadaanactccvfebgaseupnffzflxlgafohudsieixlljnvqeyuruegqslxihourfpbmnhnbgpzxrbxvazmspkdafriouzowmxeqmbyssxgfesetheaafqvotcldddqubagloyblytrzfmkivuudpwektheznegopcdbcldnlzujzmripflhahfgtbqaqvpgyefzpdraamixdyghihyhnofzoywmhkmunvntpyqvajuqholxmdvsmcihsuqivqfbsqerzbtptadkeajuurzufdregtlrotyrozdyyjavpevabtveksdbyfwhmtxvbxbuhxpuutmqfxrrpazbpijaskmhnunntpojdfkppmrhwvvnicthcxhnpjmrgmuwuwqfhwgssdmcgiekgftestjzupqjnakclpmzazaghkosnutqekzlixovhabfsspqbwfvvenygtvmwmrqxnsqejekhzcziwgtyovpyukgcpjzxeqxjvaiffwlgiyzsmztqhmxoqolhblqhxeararaljnswlwdcfxlmehqraoobydhprasgtsesugkyqbexiilmvupjvkbmsmjqgtsyltpaeyhbwbbhrpgazokrlzcibhnbpomieavawiomsfzzkwkndihwzhrpiafrsyufpzblzpvflywmaweprthnkajvplkwfjvcsiblvucjmwcjkwsszhggczzcsfrzgadkasghstkknguodxxhzftrfrnlbrwpwrjlsecvrarjvgciymaincafmlphlibteuzhrfnldcajimjxqomljxweqhyiqtcyznpnsuzzldrladelaqopgiagjhjnsdrmlrldzebcvqxqdthxvhmzcmyczekvymbnyisppljimozszqqxymqkejfewxxihupebmydhlqldrzafehscklchzjlctmuaytuhosxruqanpchvjptbykpezxikaueufuiiujmanodulozjamqduqekihdmeizqcdtfihvijrxoazgibfhoumqriiorsbbkoscxviabqddeqfayfzqptamhojdmxbpyubixhgdhqtmtcvjzdutvbiycsmchgkaeiaxbpgkpreuhoisfptugogaquijkxnyntfututflaacniiawxbxdsghavtenvatfyfkjkeisactvkmweoeubudbekwkbhctxlqabxawclzftxqyvmdaptphftdyfspdwruohjdwsbjtjkmyaabxwrosyeswoygiilbmefqhmuhkvmgljiucorrximtkwdlcmceytuyyrmcbembghmrdzcgxgbzbcscezqamnhnkuecjehouthtpqzeuibiruvneafgizllkntztgksnvtcqklhcyvvrixabwekbjdvezwfjmdrmhiabvnwwanjxbiwhmtgjfjhofpqliigrxnfehmrpjsxsmxvgrwnmpvfxaxzkrzbqccmwizqgaousmehamsdmvibzeslwbolrfxcggviotkytewihiffdwsujqmszzoxhrnktdwefkxtnratgtgnjxjhscuqysuaeuecmsdjdbuvtemhsyygvryfqrlccstckgmtfxtiumvvgwbxotlyogvsmahfcubuywihnchkxhfexfsxteysobunucuqtjwmnnujihqecemszblrzyxmaupkjzgonsvszcslpcwluijfdrfqplpaxjcmhnwbtrlypqpguhhqosmldjtupwhfqlmwikvfruqylvkbwdfmtgcvmidiqtwigrcwdphloerrcsufbgjrulwweolbryzjbnydbjsulwawtibpxfxgtnoiomfnwjdqvjuzwfcbubuoyunlbsrdjvmccyutjksduphzyzeuxdnmejlcwzhktaudwaqqragthmvclwvrrlwfqxbstmotxjelykcthiwoeobyuvirzpvkyhuxqbfwfyspzghjddvjjrctqpvuckeessrlwzznhlmfnxxuhsrntxqysyzvfumrjjybfvhubeofcfsdimcjcunfconixdcckquifqetcoevhtzqqgtrgjlhfrxfrmzrkdrehbjmcsegbgnfwvfwqtjfalftldgzemgsntnpohnmjjfrlkkktxmjynayhqwfiqvjdqdcqhjhcgnviefsrblfvmrjdgmwkajeftvfvrlnswjcvmismwxoqzqrpelaswotetaruqvmqrfjfgcnmtafpvjkrfdhibwvbrvlypvpfjnyxllldutrqkuiikkxkccnvxkkcdmlvsoududwmszpcrxf"
let s2 = "ydwhfwwwyfuwmxkpycqwrqjwfcfpvzdzienbviuczgkoumcpeikpgtdujaraegbcqeaeetxtzbddnllxpbhgurcgcpreyfozxkuqnrabglvzugxipaepgpvplckcuvpvsmluamgwnzlilgmdpotxzyiidrmrmhyqdztpqpcirpibopxydmludvbwwoltspjcqaawalrxdxnfdnzixvhpzymajcnhwtcskauevlktuuyvtkgbzheoqcciqjsdxysmwrfamvygiofgvdesdggcccezkimvhqolyvcakalmrwmfxqdszmcaenthsbrnmvmhrjktetxziceojghzorqunkiteidnlqqfjsmfmwydydvffbiefrzcnmrqveccplbkiyybimwqznlrsecrfraocbgnsazxngoqjljquksbcspyuqobkpuagfbndhpstpfzatxcwscjwqnjjtlogljhyhtgrpauxnuzlrhljgdlgdpxyahgmdwytivtqccpdukhseoajdmsaozhtnrsjvyzpigvbrxdxqresnuhyzgupaijresrlhtnjkyfwpxairirkzuajnpayhbhyerfqnmbdgqmjzvrdvlsnmxitnumipyfixlzchjwgvfzpsryxxotnuoftqffmiozywskuvnjkuehevohverpbisoblzurysiaqrsqwqfncuqkqbecvrxakrjiddmfauvetruxwqnelbufekkkwofupyssmkkobatpjthrxgwlpttfupiormualobswtzwwcnrqyxlqfrnvgeeezsacljnewfvvbtzfrvdllqrlvguiinpdxkbhqzgqafzsvvhpinjsqgnyxeoqldfrbbuadzpskrhpziuaoqrvwpionmiojuhxgkufkgaavdeujuxpmggngquxnyqhrdvpxnjwqtlnwnroswrzxxdksfvrnclwonklpomzhwldjjtyylkhgayuuzlbdgacoyhlajtpvgubvwvzmvnuibfcpncqiopzodxbbjohfswkbzgbgtubxqzjnhupkjgyduvfejonadaanactccvfebgaseupnffzflxlgafohudsieixlljnvqeyuruegqslxihourfpbmnhnbgpzxrbxvazmspkdafriouzowmxeqmbyssxgfesetheaafqvotclddrqubagloyblytrzfmkivuudpwektheznegopcdbcldnlzujzmripflhahfgtbqaqvpgyefzpdraamixdyghihyhnofzoywmhkmunvntpyqvajuqholxmdvsmcihsuqivqfbsqerzbtptadkeajuurzufdregtlrotyrozdyyjavpevabtveksdbyfwhmtxvbxbuhxpuutmqfxrrpazbpijaskmhnunntpojdfkppmrhwvvnicthcxhnpjmrgmuwuwqfhwgssdmcgiekgftestjzupqjnakclpmzazaghkosnutqekzlixovhabfsspqbwfvvenygtvmwmrqxnsqejekhzcziwgtyovpyukgcpjzxeqxjvaiffwlgiyzsmztqhmxoqolhblqhxeararaljnswlwdcfxlmehqraoobydhprasgtsesugkyqbexiilmvupjvkbmsmjqgtsylhpaeyhbwbbhrpgazokrlzcibhnbpomieavawiomsfzzkwkndihwzhrpiafrsyufpzblzpvflywmaweprthnkajvplkwfjvcsiblvucjmwcjkwsszhggczzcsfrzgadkasghstkknguodxxhzftrfrnlbrwpwrjlsecvrarjvgciymaincafmlphlibteuzhrfnldcajimjxqomljxweqhyiqecyznpnsuzzldrladelaqoqgiagjhjnsdrmlrldzebcvqxqdthxvhmzcmyczekvymbnyisppljimozszqqxymqkejfewxxihupebmydhlqldrzafehscklchzjlctmuaytuhosxruqanpchvjptbykpezxikaueufuiiujmanodulozjamqduqekihdmeizqcdtfihvvjrxoazgibfhoumqriiorsbbkoscxviabqddeqfayfzqptamhojdmxbpyubixhgdhqtmtcvjzdutvbiycsmchgkaeiaxbpgkpreuhoisfptugogbquijkxnyntfututflaacniiawxbxdsghavtenvatfyfkjkeisactvkmweotubudbekwkbhctxlqabxawclzftxqyvmdaptphftdyfspdwruohjdwsbjtjkmyaabxwrosyeswoygiilbmefqhmuhkvmgljiucorrximtkwdlcmceytuyyrmcbembghmrdzcgxgbzbcscezqamnhnkuecjehouthtpqzeuibiruvneafgizllkntztgksnvtcqklhcyvvrixabwekbjdvezwfjmdrmhiabvnwwanjxbiwhmtgjfjhofpqliigrsnfehmrpjsxsmxvgrwnmpvfxaxzkrzbqccmwizqgaousmehamsdmvibzeslwbolrfxcggviotkytewihiffdwsujqmszzoxhrnktdwefkxtnratgtgnjxjhscuqysuaeuecmsdjdbuvtemhsyygvryfqrlccstckgmtfxtiumvvgwbxotlyogvsmahfcubuywihnchkxhfexfsxteysowunucuqtjwmnnujihqecemszblrzyxmaupkjzgonsvszcslpcwluijfdrfqplpaxjcmhnwbtrlypqpguhhqosmldjtupwhfqlmwikvfruqylvkbwdfmtgcvmidiqtwigrcwdphloerrcsufbgjrulwweolbryzjbnydbjsulwawtibpxfxgtnoiomfnwjdqvjuzwfcbubuoyunlbsrdjvmccyutjksduphzyzeuxdnmejlcwzhktaudwapqragthmvclwvrrlwfqxbstmotxjelykcthiwoeobyuvirzpikyhuxqbfwfyspzghjddvjjrctqpvuckeessrlwzznhlmfnxxuhsrntxqysyzvfumrjjybfvtubeofcfsdimcjcunfconixdcckquifqetcoevhtzqqgtrgjlhfrxfrmzrkdrehbjmcsegbgnfwvfwqtjfalftldgzemgsntnpohnmjjfrlkkktxmjynayhqwfiqvjdqdcqhjhcgnviefsrblfvmrjdgmwkajeftvfvrljswjcvmismwxoqzqrpelaswotetaruqvmqrfjfgcnmtafpvjkrfdhibwvbdvlypvpfjnyxllldutrqkuiikkxkccnvxkkcdmlvsoududwmszpcrxfyckgdnhxvbhipxailopjpagjtssubjqryszvakdzmqqensqpmlobdohunwmqdvsexcotpmbdnrzjozymmahpvxrfvqjyppkguqeqfjzqquunjucpklshfizqsdsozcfhroomsceknndlakucrsyfkkjeauuhblcwfubtatghwjwylgtixidghdkpwsxvyucwzjovegwuzmdmzdzipapaftthkxcqzhbxzuxdysmydkqxdzoiwvlcllkfqrplmmzlvdafrvujssdjlosjhxrmkolygnmhafjzsoqzzgqixbblfeakrqzcozpfhaldatxdawaencurqlkqmontijupsaxpdzuodecpztnsfvgtxxsnlqhuxojdllylacuknrpelcxlfqrnohnzynmvmrymndpraehvdzpyqbfcqpoospnnumxvbjkfximgpzfvqkxixcccxkpsbebarqjlnoruguynbqjnsyqatwmxjxkinemdscabmvjepayznbsnrcvwnsiwciaeyurrzxspaggwtbcwcgcxygzyvaqsiuemwqfigqoiupelteadpkmtrjzsfcmtdnbxviagxxxjfnyxkfpoypzewzqyjwynavgvxkdmmklbupcvswmfgjszfttodzpjjzdpmcuprzkzgkawsjttitwsmlfzveqpsnreurbxktxbnhopghituwzdqreqixlrjyflambpwtvauuqwdiihxdvvgmudztstoasyznviqclgrkfooxiaftlfgafcvqzqvvgqnteruftasazvqqltgyezacmjolusiyfaptyaugprvrmdadpkkqjzzyuuiajdojrwnvcsyrbilfkwsthlatekadqwrbexptujelyjlhckgzodzegnwavhjtzdhgngaygylxunyitnnbhfzrcqrbedkydkotnlaxxivreyqzprtoqifuglaneimgtltxtvabeyhowyhvercjscsjtcvbihorrcprfhwlkfplfvxvwydlqlfxksvjspyzjbsituzbawcushnrpbqtsybjuwdhwmilcmyhocyafcxdwmtnjdgribthfgjcvvdgggmevoujuxebbdgjymfcssrocrfefzhjajcaggezbvzfnajjrdsswvnlfhmbemxiibvbbisrpdaecvgexdhanenawkxfdesvqvjkxtjwfprmcqgizqjakkvbqszfexgrkhqsbvpagulmkeltzlldflzlwfluxjtrzgyturuvngqsdwwjvnvesingccnmgydwpxqxszhwcpiilkwtlbkoqkgxidomcmwhpbispyntpwydcljijcxpgbdquiangjcsgqerddvwbasrokfwttzcwvxwctzqqeizkazcvilyaqiwpgtresrvmmsovmngszwxqgsicuavurejrxqhqhdogizjyrgtscrswuqduludhpqoaqgoremhcwothfxtwamlpbjuxknaootmgrgqwsfviauavltgjmnewwampfkxgnptbtwlvephmqjitrbqizhkxpbltpirxvkbeeytrjfjyvfkxpoydfopgkfogrbwkruirmpztudohctalqnlwjnjgxhrnlcfrtbnaaxheaedkhubxlylvxgjicisijslypysyyrxhveknlpswcveggzypxtouftekmktmbhzmjxijgegrelttuzxgxeontzylnmadtygmgfrwjdxavcahctbfrwgpizvygtrilecddmihbacugavkpqxunwtzxakssyfqixpqsohxpznknrptsijjvfrqwafhzqedbevybbcwlrcinnqmonigwmmcfteehdjnpmivzarzjlsswdzwdyojliqyxasploqcuowsnepemzsrasnrwxudbozpiaawvfkmiibjpbmjptavrzjaxvqdpdbjavhzmdyoooqwaxualbxbbwlnxyclxrmrrsbczbelkgmszbtarhjzyptkhtmekbigdduhfuqokqabgbdwoyewvsdbgthcxlefmcglnkghioigivsyirhtrmtcygsvboykbbxrrxqtghtztwmguoojyskkovsswxuqsbevfxexaddndjamwnmwlqfniuzvgwddwaaktkuhsmegkklakvcphurrctywbwnwuzfhrsqpmcxrcqopiyhrrtoyrlgkeyusswndesokqsjhsyveioagkkiftwwkdwmastkhvnvnpxyrjvuavwbahtzanolkzviqhduoznybklsipqquhvhevpyfnbixivtaqdsfi"

let c = "ab"
let d = "eidbaooo"
Solution().checkInclusion(s1, s2)
